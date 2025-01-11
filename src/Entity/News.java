package Entity;

public class News {
    private int newsId;
    private String newsTitle;
    private String newsContent;
    private String pubPerson;
    private String pubDate;
    public News() {}
    public News(int newsId, String newsTitle, String newsContent, String pubPerson, String pubDate) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.pubPerson = pubPerson;
        this.pubDate = pubDate;
    }
    public int getNewsId() {
        return newsId;
    }
    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }
    public String getNewsTitle() {
        return newsTitle;
    }
    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }
    public String getNewsContent() {
        return newsContent;
    }
    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }
    public String getPubPerson() {
        return pubPerson;
    }
    public void setPubPerson(String pubPerson) {
        this.pubPerson = pubPerson;
    }
    public String getPubDate() {
        return pubDate;
    }
    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }
}
