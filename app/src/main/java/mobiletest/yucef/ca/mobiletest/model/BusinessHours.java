package mobiletest.yucef.ca.mobiletest.model;

public class BusinessHours {
    String from;
    String to;

    public BusinessHours(String from, String to) {
        this.from = from;
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }
}
