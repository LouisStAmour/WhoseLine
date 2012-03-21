class PlaylistClipsController < ApplicationController
  # GET /playlist_clips
  # GET /playlist_clips.json
  def index
    @playlist_clips = PlaylistClip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlist_clips }
    end
  end

  # GET /playlist_clips/1
  # GET /playlist_clips/1.json
  def show
    @playlist_clip = PlaylistClip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist_clip }
    end
  end

  # GET /playlist_clips/new
  # GET /playlist_clips/new.json
  def new
    @playlist_clip = PlaylistClip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist_clip }
    end
  end

  # GET /playlist_clips/1/edit
  def edit
    @playlist_clip = PlaylistClip.find(params[:id])
  end

  # POST /playlist_clips
  # POST /playlist_clips.json
  def create
    @playlist_clip = PlaylistClip.new(params[:playlist_clip])

    respond_to do |format|
      if @playlist_clip.save
        format.html { redirect_to @playlist_clip.playlist, notice: 'Playlist clip was successfully created.' }
        format.json { render json: @playlist_clip, status: :created, location: @playlist_clip }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playlist_clips/1
  # PUT /playlist_clips/1.json
  def update
    @playlist_clip = PlaylistClip.find(params[:id])

    respond_to do |format|
      if @playlist_clip.update_attributes(params[:playlist_clip])
        format.html { redirect_to @playlist_clip, notice: 'Playlist clip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist_clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_clips/1
  # DELETE /playlist_clips/1.json
  def destroy
    @playlist_clip = PlaylistClip.find(params[:id])
    @playlist_clip.destroy

    respond_to do |format|
      format.html { redirect_to playlist_clips_url }
      format.json { head :no_content }
    end
  end
  
  def sort
    params[:playlist_clip].each_with_index do |id, index|
      PlaylistClip.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end
