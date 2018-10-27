package ca.ivasenko.mobiletest.Utils;

import android.arch.persistence.room.TypeConverter;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.List;

import ca.ivasenko.mobiletest.resources.model.Address;
import ca.ivasenko.mobiletest.resources.model.BusinessHours;
import ca.ivasenko.mobiletest.resources.model.ContactInfo;
import ca.ivasenko.mobiletest.resources.model.FreeText;
import ca.ivasenko.mobiletest.resources.model.SocialMedia;

public class Converters
{
    @TypeConverter
    public static BusinessHours stringToBusinessHours(String json) {
        Gson gson = new Gson();
        Type type = new TypeToken<BusinessHours>() {}.getType();
        BusinessHours businessHours = gson.fromJson(json, type);
        return businessHours;
    }

    @TypeConverter
    public static String businessHoursToString(BusinessHours businessHours) {
        Gson gson = new Gson();
        Type type = new TypeToken<BusinessHours>() {}.getType();
        String json = gson.toJson(businessHours, type);
        return json;
    }

    @TypeConverter
    public static ContactInfo stringToContactInfo(String json) {
        Gson gson = new Gson();
        Type type = new TypeToken<ContactInfo>() {}.getType();
        ContactInfo contactInfo = gson.fromJson(json, type);
        return contactInfo;
    }

    @TypeConverter
    public static String contactInfoToString(ContactInfo contactInfo) {
        Gson gson = new Gson();
        Type type = new TypeToken<ContactInfo>() {}.getType();
        String json = gson.toJson(contactInfo, type);
        return json;
    }

    @TypeConverter
    public static SocialMedia stringToSocialMedia(String json) {
        Gson gson = new Gson();
        Type type = new TypeToken<SocialMedia>() {}.getType();
        SocialMedia socialMedia = gson.fromJson(json, type);
        return socialMedia;
    }

    @TypeConverter
    public static String socialMediaToString(SocialMedia socialMedia) {
        Gson gson = new Gson();
        Type type = new TypeToken<SocialMedia>() {}.getType();
        String json = gson.toJson(socialMedia, type);
        return json;
    }

    @TypeConverter
    public static List<Address> stringToAddresses(String json) {
        Gson gson = new Gson();
        Type type = new TypeToken<List<Address>>() {}.getType();
        List<Address> addresses = gson.fromJson(json, type);
        return addresses;
    }

    @TypeConverter
    public static String addressesToString(List<Address> addresses) {
        Gson gson = new Gson();
        Type type = new TypeToken<List<Address>>() {}.getType();
        String json = gson.toJson(addresses, type);
        return json;
    }

    @TypeConverter
    public static List<FreeText> stringToFreeText(String json) {
        Gson gson = new Gson();
        Type type = new TypeToken<List<FreeText>>() {}.getType();
        List<FreeText> freeTexts = gson.fromJson(json, type);
        return freeTexts;
    }

    @TypeConverter
    public static String freeTextsToString(List<FreeText> freeTexts) {
        Gson gson = new Gson();
        Type type = new TypeToken<List<FreeText>>() {}.getType();
        String json = gson.toJson(freeTexts, type);
        return json;
    }

    @TypeConverter
    public static Date toDate(Long timestamp) {
        return timestamp == null ? null : new Date(timestamp);
    }

    @TypeConverter
    public static Long toTimestamp(Date date) {
        return date == null ? null : date.getTime();
    }
}
