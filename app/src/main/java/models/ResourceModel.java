package models;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;

public class ResourceModel implements Parcelable {

    private String title;
    private ArrayList<Address> addresses;
    private ContactInfo contactInfo;

    public ResourceModel(String title, ArrayList<Address> addresses, ContactInfo contactInfo) {
        this.title = title;
        this.addresses = addresses;
        this.contactInfo = contactInfo;
    }

    public String getTitle() {
        return title;
    }

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public ArrayList<Address> getAddresses() {
        return addresses;
    }

    public ResourceModel(Parcel in) {
        this.title = in.readString();
        this.addresses = new ArrayList<>();
        in.readTypedList(this.addresses, Address.CREATOR);
        this.contactInfo = in.readParcelable(ContactInfo.class.getClassLoader());
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.title);
        dest.writeTypedList(this.addresses);
        dest.writeParcelable(this.contactInfo,flags);
    }

    public static final Parcelable.Creator<ResourceModel> CREATOR = new Parcelable.Creator<ResourceModel>() {
        @Override
        public ResourceModel createFromParcel(Parcel source) {
            return new ResourceModel(source);
        }

        @Override
        public ResourceModel[] newArray(int size) {
            return new ResourceModel[size];
        }
    };

}
