Book.create([
  {
    title: "Confessions",
    publisher: "Penguin Classics",
    publication_year: "2004",
    isbn: "9780140441147",
    summary: "Confessions is Augustine's autobiographical work that explores his spiritual journey and conversion to Christianity.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Augustine")]
  },
  {
    title: "Summa Theologica",
    publisher: "Dover Publications",
    publication_year: "2010",
    isbn: "9780486443767",
    summary: "Thomas Aquinas' comprehensive exploration of Christian theology and philosophy, bridging faith and reason.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Thomas")]
  },
  {
    title: "On the Priesthood",
    publisher: "St. Vladimir's Seminary Press",
    publication_year: "1984",
    isbn: "9780881410398",
    summary: "A treatise by John Chrysostom on the responsibilities and challenges of Christian ministry.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "John")]
  },
  {
    title: "The Bondage of the Will",
    publisher: "Baker Academic",
    publication_year: "2012",
    isbn: "9780801048939",
    summary: "Martin Luther's response to Erasmus, emphasizing human depravity and the necessity of divine grace.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Martin")]
  },
  {
    title: "Institutes of the Christian Religion",
    publisher: "Hendrickson Publishers",
    publication_year: "2008",
    isbn: "9781598561685",
    summary: "John Calvin's foundational work on Reformed theology, addressing key Christian doctrines.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "John")]
  },
  {
    title: "Commentary on True and False Religion",
    publisher: "Pickwick Publications",
    publication_year: "2007",
    isbn: "9781556351934",
    summary: "Ulrich Zwingli's work addressing the authority of Scripture and contrasting true and false religion.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Ulrich")]
  },
  {
    title: "An Enquiry into the Obligations of Christians",
    publisher: "Cambridge University Press",
    publication_year: "1991",
    isbn: "9781108023284",
    summary: "William Carey's influential work advocating for missionary efforts and the global spread of Christianity.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "William")]
  },
  {
    title: "Missionary Travels and Researches in South Africa",
    publisher: "Harper & Brothers",
    publication_year: "1857",
    isbn: "9780486259214",
    summary: "David Livingstone's account of his missionary work and exploration in Africa.",
    genre: "Biography",
    language: "English",
    authors: [Author.find_by(name: "David")]
  },
  {
    title: "Peace with God",
    publisher: "Thomas Nelson",
    publication_year: "1984",
    isbn: "9780849900675",
    summary: "Billy Graham's guide to living a life of faith and finding peace through Jesus Christ.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Billy")]
  },
  {
    title: "The Cost of Discipleship",
    publisher: "Touchstone",
    publication_year: "1995",
    isbn: "9780684815008",
    summary: "Dietrich Bonhoeffer's challenge to live a life of radical discipleship in the face of worldly opposition.",
    genre: "Theology",
    language: "English",
    authors: [Author.find_by(name: "Dietrich")]
  }
])
