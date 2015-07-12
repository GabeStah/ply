json.array!(@videos) do |video|
  json.extract! video, :id, :name, :youtube_id, :duration, :release_date, :published, :privacy
  json.url video_url(video, format: :json)
end
