# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#pc').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  
	$('#playlist_clip_clip_id').autocomplete
	  source: $('#playlist_clip_clip_id').data('autocomplete-source')
	
	jwplayer("mediaplayer").setup(
		"flashplayer": "/assets/player.swf"
		"playlist.position": "none"
		"controlbar.position": "none"
		"playlist.size": 270
		"logo.over": 0
		"logo.out": 0
		'repeat': 'list'
	)
	
	$("#loadPlaylistButton").click ->
		playlist = [] # jwplayer().getPlaylist()
		$('#pc li').each ->
			playlist.push( 
				file: '/'+$(this).data('filename')
				title: $(this).text().trim()
			)
		jwplayer().load(playlist)
