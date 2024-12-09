module AdminsDashboard::SermonsHelper
  def youtube_embed_url(url)
    video_id = url.split("v=").last.split("&").first
    "https://www.youtube.com/embed/#{video_id}"
  end
end
