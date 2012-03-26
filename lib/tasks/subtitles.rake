def string_to_ms(srt_time_string)
	unless srt_time_string.nil? # Shouldn't have to do this!?
		t = srt_time_string.split(/[:,]/).map{|i| i.to_i}
		r = 0
		r += t[3] unless t[3].nil?
		r += t[2]*1000 unless t[2].nil?
		r += t[1]*1000*60 unless t[1].nil?
		r += t[0]*1000*60*60 unless t[0].nil?
	else
		0
	end
end

def parse(filename)
	subs = open(filename).read
	parsed = []
	subs.split(/\r\n\r\n|\n\n/).each do |stxt|
		subs_split = stxt.strip.split(/\r\n|\n/)
		if subs_split.length >= 3
			parsed << {
				:sub_no => subs_split[0].to_i,
				:start_time => subs_split[1].split(' --> ')[0],
				:start_ms => string_to_ms(subs_split[1].split(' --> ')[0]),
				:end_time => subs_split[1].split(' --> ')[1],
				:end_ms => string_to_ms(subs_split[1].split(' --> ')[1]),
				:lines => subs_split[2..-1]
			}
		end
	end
	parsed
end

def process_subtitle(sub, m, num_subs)
  movie_file = ENV['MOVIE'] || 'Sintel 2010 720p DM x264-EbP.mkv'
  ss_offset = (ENV['SS_OFFSET'] || -1000).to_i
  t_offset = (ENV['T_OFFSET'] || 500).to_i
  
  puts "Encoding #{sub[:sub_no]} of #{num_subs}: #{sub[:lines].join(' | ')}"
  ss = (sub[:start_ms]+ss_offset)
  t = (sub[:end_ms]-sub[:start_ms]+t_offset)
  ss = 0 if ss < 0
  t = 0 if t < 0
  FileUtils.mkdir_p "public/clips/#{m.id}"
  filename = "clips/#{m.id}/#{sub[:sub_no]}.mp4"
  `ffmpeg -i '#{movie_file}' -ss #{ss/1000.0} -t #{t/1000.0} -strict -2 -loglevel panic -vcodec libx264 -ac 2 -acodec aac -y 'public/#{filename}'`
  m.clips.create(:filename => '/'+filename, 
                :subtitle => sub[:lines].join(' '), 
                :start_ms => ss,
                :end_ms => t)
end

namespace :movie do
  desc "Load a subtitle file as a new movie, takes SRT, MOVIE env vars with optional SS_OFFSET, T_OFFSET and SUB_NUM."
  task :from_srt => :environment do
    srt_file = ENV['SRT'] || 'Sintel 2010 720p DM x264-EbP.srt'
    sub_num = (ENV['SUB_NUM'] || -1).to_i
    to_sub_num = (ENV['TO_SUB_NUM'] || -1).to_i
    
    m = Movie.find_or_create_by_name(File.basename(srt_file, '.*'))

    subtitles = parse srt_file
    if sub_num == -1
      m.clips.clear
      subtitles.each { |sub| process_subtitle(sub, m, subtitles.length) }
    else
      subset = subtitles[sub_num-1..to_sub_num]
      subset.each do |sub|
        process_subtitle(sub, m, subtitles.length)
      end
    end
  end
end