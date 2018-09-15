package models;

import android.os.Parcel;
import android.os.Parcelable;

public class ContactInfo implements Parcelable {

    private String phone;
    private String website;
    private String email;
    private String fax;
    private String tollPhone;

    public ContactInfo(String phone, String website, String email, String fax, String tollPhone) {
        this.phone = phone;
        this.website = website;
        this.email = email;
        this.fax = fax;
        this.tollPhone = tollPhone;
    }


    public ContactInfo(Parcel in) {
        this.phone = in.readString();
        this.website = in.readString();
        this.email = in.readString();
        this.fax = in.readString();
        this.tollPhone = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.phone);
        dest.writeString(this.website);
        dest.writeString(this.email);
        dest.writeString(this.fax);
        dest.writeString(this.tollPhone);
    }


    public static final Parcelable.Creator<ContactInfo> CREATOR = new Parcelable.Creator<ContactInfo>() {
        @Override
        public ContactInfo createFromParcel(Parcel source) {
            return new ContactInfo(source);
        }

        @Override
        public ContactInfo[] newArray(int size) {
            return new ContactInfo[size];
        }
    };

    public String getPhone() {
        return phone;
    }

    public String getWebsite() {
        return website;
    }

    public String getEmail() {
        return email;
    }

    public String getFax() {
        return fax;
    }

    public String getTollPhone() {
        return tollPhone;
    }

}
