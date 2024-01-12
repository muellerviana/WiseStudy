require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with valid attributes" do
    article = Article.new(title: "Test Article", author: "John Doe",content: "Lorem ipsum")
    expect(article).to be_valid
  end

  it "is not valid without a title" do
    article = Article.new(author: "John Doe", content: "Lorem ipsum")
    expect(article).to_not be_valid
  end

  it "is not valid without a author" do
    article = Article.new(title: "Test Article", content: "Lorem ipsum")
    expect(article).to_not be_valid
  end

  it "is not valid without a content" do
    article = Article.new(title: "Test Article", author: "John Doe")
    expect(article).to_not be_valid
  end

  it "can update the article title" do
    article = Article.create(title: "Original Title", author:"Jhon Doe", content: "Lorem ipsum")
    article.update(title: "Updated Title")
    expect(article.reload.title).to eq("Updated Title")
  end

  it "can destroy the article" do
    article = Article.create(title: "To be destroyed", author:"Jhon Doe", content: "Lorem ipsum")
    expect { article.destroy }.to change { Article.count }.by(-1)
  end
end