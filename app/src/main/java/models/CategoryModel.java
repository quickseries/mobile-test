package models;

import android.os.Parcel;
import android.os.Parcelable;

public class CategoryModel implements Parcelable {

    private String slug;
    private String title;

    public String getSlug() {
        return slug;
    }

    public String getTitle() {
        return title;
    }

    public CategoryModel(String slug, String title) {
        this.slug = title;
        this.title = title;
    }

    public CategoryModel(Parcel in) {
        this.slug = in.readString();
        this.title = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.slug);
        dest.writeString(this.title);
    }

    public static final Parcelable.Creator<CategoryModel> CREATOR = new Parcelable.Creator<CategoryModel>() {
        @Override
        public CategoryModel createFromParcel(Parcel source) {
            return new CategoryModel(source);
        }

        @Override
        public CategoryModel[] newArray(int size) {
            return new CategoryModel[size];
        }
    };

}
