import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["book", "chapter"]

  async connect() {
    // Load chapters when controller connects (page load)
    await this.updateChapters()
    
    // Load verses after chapters are loaded
    //await this.updateVerses()
  }

  async updateChapters() {
    const bookName = this.bookTarget.value
    if (!bookName) return

    try {
      const response = await fetch(`/site/bible_books/${encodeURIComponent(bookName)}/chapters`)
      const html = await response.text()
      this.chapterTarget.innerHTML = html
      this.chapterTarget.disabled = false
      
      // Reset verse when book changes
      //this.verseTarget.innerHTML = ""
    } catch (error) {
      console.error("Error loading chapters:", error)
      this.chapterTarget.innerHTML = '<option>Erro ao carregar capítulos</option>'
    }
  }

  // async updateVerses() {
  //   const bookName = this.bookTarget.value
  //   const chapterNumber = this.chapterTarget.value
    
  //   if (!bookName || !chapterNumber) return

  //   try {
  //     const response = await fetch(`/site/bible_books/${encodeURIComponent(bookName)}/chapters/${chapterNumber}/verses`)
  //     const html = await response.text()
  //     this.verseTarget.innerHTML = html
  //     this.verseTarget.disabled = false
  //   } catch (error) {
  //     console.error("Error loading verses:", error)
  //     this.verseTarget.innerHTML = '<option>Erro ao carregar versículos</option>'
  // }
 // }
}