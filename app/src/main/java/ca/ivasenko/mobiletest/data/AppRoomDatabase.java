package ca.ivasenko.mobiletest.data;

import android.arch.persistence.room.Database;
import android.arch.persistence.room.Room;
import android.arch.persistence.room.RoomDatabase;
import android.content.Context;

import ca.ivasenko.mobiletest.categories.data.CategoryDao;
import ca.ivasenko.mobiletest.categories.model.Category;

@Database(entities = {Category.class}, version = 1, exportSchema = false)
public abstract class AppRoomDatabase extends RoomDatabase
{
    public abstract CategoryDao categoryDao();

    private static volatile AppRoomDatabase INSTANCE;

    public static AppRoomDatabase getDatabase(final Context context)
    {
        if (INSTANCE == null) {
            synchronized (AppRoomDatabase.class) {
                if (INSTANCE == null) {
                    INSTANCE = Room.databaseBuilder(context.getApplicationContext(),
                            AppRoomDatabase.class, "mobile_test_database")
                            .build();
                }
            }
        }
        return INSTANCE;
    }
}
