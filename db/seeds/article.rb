Article.create([
  {
    title: "The Life of Augustine of Hippo",
    description: "A brief overview of Augustine's influence on theology.",
    body: "Augustine of Hippo, one of the most influential early church fathers, shaped Christian theology with works like 'Confessions' and 'The City of God'. His ideas on grace and salvation continue to influence Christian thought.",
    authors: [Author.find_by(name: "Augustine")]
  },
  {
    title: "The Wisdom of Thomas Aquinas",
    description: "A summary of Aquinas' contributions to theology and philosophy.",
    body: "Thomas Aquinas was a Dominican friar and theologian whose work, 'Summa Theologica,' systematized Christian theology and bridged the gap between faith and reason.",
    authors: [Author.find_by(name: "Thomas")]
  },
  {
    title: "John Chrysostom: The Golden Mouth",
    description: "A summary of the eloquent preacher's life and works.",
    body: "John Chrysostom, known for his eloquent preaching, was a key figure in early Christianity. His homilies and writings continue to be celebrated for their theological depth and moral guidance.",
    authors: [Author.find_by(name: "John")]
  },
  {
    title: "The Reformation Legacy of Martin Luther",
    description: "A brief account of Luther's role in the Protestant Reformation.",
    body: "Martin Luther, a German monk and theologian, initiated the Protestant Reformation with his '95 Theses,' challenging the practices of the Catholic Church and advocating salvation by faith alone.",
    authors: [Author.find_by(name: "Martin")]
  },
  {
    title: "John Calvin and the Reformed Tradition",
    description: "An overview of Calvin's impact on Protestantism.",
    body: "John Calvin, a key figure in the Reformed tradition, wrote 'Institutes of the Christian Religion,' which laid the groundwork for Reformed theology and influenced Protestantism worldwide.",
    authors: [Author.find_by(name: "John")]
  },
  {
    title: "Ulrich Zwingli: The Swiss Reformer",
    description: "A summary of Zwingli's contributions to the Reformation.",
    body: "Ulrich Zwingli, a contemporary of Martin Luther, led the Swiss Reformation, emphasizing the authority of Scripture and rejecting certain Catholic traditions.",
    authors: [Author.find_by(name: "Ulrich")]
  },
  {
    title: "William Carey: The Father of Modern Missions",
    description: "A brief account of Carey's missionary work in India.",
    body: "William Carey, a British missionary, is considered the 'Father of Modern Missions.' He translated the Bible into multiple Indian languages and pioneered mission work in India.",
    authors: [Author.find_by(name: "William")]
  },
  {
    title: "David Livingstone: Missionary and Explorer",
    description: "An overview of Livingstone's work in Africa.",
    body: "David Livingstone combined missionary work with exploration, spreading Christianity and Western knowledge across Africa while opposing the slave trade.",
    authors: [Author.find_by(name: "David")]
  },
  {
    title: "Billy Graham: Preaching to the Nations",
    description: "A summary of Billy Graham's global ministry.",
    body: "Billy Graham was one of the most influential evangelists of the 20th century, preaching to millions worldwide and emphasizing personal salvation through Jesus Christ.",
    authors: [Author.find_by(name: "Billy")]
  },
  {
    title: "Dietrich Bonhoeffer: A Life of Sacrifice",
    description: "A brief account of Bonhoeffer's resistance to Nazi oppression.",
    body: "Dietrich Bonhoeffer was a German pastor and theologian who resisted the Nazi regime. His book, 'The Cost of Discipleship,' continues to inspire Christians to live out their faith courageously.",
    authors: [Author.find_by(name: "Dietrich")]
  }
])
