sermons = [
  {
    title: "A Vinda de Cristo para Julgar Sodoma e Gomorra",
    format: "Video",
    description: "Série: As Vindas de Cristo em Juízo no Velho Testamento - Parte 1",
    video_url: "https://www.youtube.com/embed/_5MT_gI485U?si=Dxgw1hDJKJ4ascZ7",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: "Gênesis 18:1-33",
    language: "Português"
  },
  {
    title: "Don't Waste Your Life",
    format: "Video",
    description: "In this lecture, Dr. John Piper exhorts all of us to not waste our lives on such trivial pursuits.",
    video_url: "https://youtu.be/JHdB1dYAteA?si=G5E5nao-DLmRtMYQ",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: "Gênesis 1:1-10",
    language: "English"
  }
]

sermons.each do |sermon|
  Sermon.create(
    title: sermon[:title],
    format: sermon[:format],
    description: sermon[:description],
    video_url: sermon[:video_url],
    audio_url: sermon[:audio_url],
    duration: sermon[:duration],
    date: sermon[:date],
    category: sermon[:category],
    bible_text: sermon[:bible_text],
    language: sermon[:language]
  )
end
