package com.android.kotlin.utils

import android.Manifest
import android.content.Context
import android.net.Uri
import android.util.Log
import com.squareup.picasso.Downloader
import com.squareup.picasso.OkHttp3Downloader
import com.squareup.picasso.Picasso
import java.io.File

class PicassoCache
/**
 * PicassoCache Constructor
 *
 * @param context application Context
 */
private constructor(context: Context) {
    private var cacheDir: File? = null

    init {
        if (Util.isPermissionAvailable(context, Manifest.permission.WRITE_EXTERNAL_STORAGE) && android.os.Environment.getExternalStorageState() == android.os.Environment.MEDIA_MOUNTED) {
            cacheDir = context.externalCacheDir
        } else {
            cacheDir = context.cacheDir
        }
        val downloader: Downloader
        if (cacheDir != null) {
            downloader = OkHttp3Downloader(cacheDir, PICASSO_DISK_CACHE_SIZE)
        } else {
            downloader = OkHttp3Downloader(context, PICASSO_DISK_CACHE_SIZE)
        }
        val builder = Picasso.Builder(context)
        builder.downloader(downloader)
        builder.listener { picasso, uri, exception ->
            try {
                Log.d("Picasso Log", "Picasso PicassoCache onImageLoadFailed : " + exception.message + " : " + uri.toString())
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
        picassoInstance = builder.build()

    }

    companion object {

        /**
         * Static Picasso Instance
         */
        private var picassoInstance: Picasso? = null

        private val PICASSO_DISK_CACHE_SIZE = (1024 * 1024 * 10).toLong()

        /**
         * Get Singleton Picasso Instance
         *
         * @param context application Context
         * @return Picasso instance
         */
        fun getPicassoInstance(context: Context): Picasso? {

            if (picassoInstance == null) {

                PicassoCache(context)
                return picassoInstance
            }

            return picassoInstance
        }

        fun getNewPicassoInstance(context: Context): Picasso? {
            PicassoCache(context)
            return picassoInstance
        }
    }


}