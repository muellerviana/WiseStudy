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
    bible_text: nil,
    language: "English"
  },
  {
    title: "True Source of Strength",
    format: "Video",
    description: "Paul Washer preaching True Source of Strength",
    video_url: "https://www.youtube.com/embed/5dXA1pPNs3Q?si=xcWJZa6MXcZ3YV0z",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: "Daniel 11:32-33",
    language: "English"
  },
  {
    title: "Jesus Calls You by Name",
    format: "Video",  
    description: "Many things hinder us from coming to Jesus Christ. And yet, Jesus is calling us by name to Himself.",
    video_url: "https://www.youtube.com/embed/7c_yxXjQMyI?si=e-ECr0EUGYcIZPZK",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: nil,
    language: "English"
  },
  {
    title: "Think Well and Do Well",
    format: "Video",
    description: "A sermon delivered by C.H. Spurgeon, Lord's day morning, October 23rd 1870.",
    video_url: "https://www.youtube.com/embed/Mm8srJyFgLA?si=B3h-p6YaI1p1r-RB&amp",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: "Psalm 26:3",
    language: "English"
  },
  {
    title: "Por que Muitos Cristãos não Oram? ",
    format: "Video",
    description: "Paulo Junior",
    video_url: "https://www.youtube.com/embed/nawfF4wPU2g?si=9y11heRx_dJaD6wE",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: nil,
    language: "Português"
  },
  {
    title: "O QUE ACONTECE QUANDO PERDEMOS O PRIMEIRO AMOR?",
    format: "Video",
    description: "Como está o seu relacionamento com Deus? No vídeo, Hernandes Dias Lopes analisa a mensagem de Jesus à Igreja de Éfeso em Apocalipse 2:1-7",
    video_url: "https://www.youtube.com/embed/1zTh8UcZuGc?si=y5w6UmkLbUSHsdsr&amp",
    audio_url: nil,
    duration: nil,
    date: nil,
    category: nil,
    bible_text: "Apocalipse 2:1-7",
    language: "Português"
  },
  {
    title: "Living with Eternal Perspective",
    format: "Video",
    description: "A powerful message about living with eternity in mind.",
    video_url: "https://www.youtube.com/embed/xyz123abc?si=example1",
    audio_url: nil,
    duration: "45 minutes",
    date: "2025-01-18",
    category: "Christian Living",
    bible_text: "2 Corinthians 4:16-18",
    language: "English"
  },
  {
    title: "The Power of Persistent Prayer",
    format: "Video",
    description: "This sermon focuses on the importance of persistent and faithful prayer.",
    video_url: "https://www.youtube.com/embed/abc456def?si=example2",
    audio_url: nil,
    duration: "1 hour",
    date: "2025-01-19",
    category: "Prayer",
    bible_text: "Luke 18:1-8",
    language: "English"
  },
  {
    title: "God's Sovereignty in Suffering",
    format: "Video",
    description: "An encouraging message on finding hope in God's sovereignty during trials.",
    video_url: "https://www.youtube.com/embed/uvw789ghi?si=example3",
    audio_url: nil,
    duration: "50 minutes",
    date: "2025-01-20",
    category: "Suffering",
    bible_text: "Romans 8:28-30",
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
