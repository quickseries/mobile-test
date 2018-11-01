package com.quickseries.mobiletest.components

import android.content.Context
import android.support.v7.widget.AppCompatImageView
import android.text.TextUtils
import android.util.AttributeSet
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import com.quickseries.mobiletest.R

typealias ButtonClickDelegate = () -> Unit

class DetailRowView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null, defStyle: Int = 0) :
    LinearLayout(context, attrs, defStyle) {

    var rowType: RowType = RowType.PHONE
    val titleTextView: TextView
    val contentTextView: TextView
    val button1ImageView: AppCompatImageView
    val button2ImageView: AppCompatImageView

    var button1OnClick: ButtonClickDelegate? = null
    var button2OnClick: ButtonClickDelegate? = null

    init {
        isClickable = true
        orientation = LinearLayout.VERTICAL
        LayoutInflater.from(context).inflate(R.layout.component_detail_row_view, this, true)
        titleTextView = findViewById(R.id.titleTextView)
        contentTextView = findViewById(R.id.contentTextView)
        button1ImageView = findViewById(R.id.button1ImageView)
        button2ImageView = findViewById(R.id.button2ImageView)

        attrs?.let {
            val a = context.theme.obtainStyledAttributes(it, R.styleable.DetailRowView, defStyle, 0)
            try {
                rowType = RowType.from(a.getInt(R.styleable.DetailRowView_drv_rowType, 0))
                titleTextView.text = a.getString(R.styleable.DetailRowView_drv_title) ?: ""
                contentTextView.text = a.getString(R.styleable.DetailRowView_drv_content) ?: ""
            } finally {
                a.recycle()
            }
        }

        button1ImageView.setOnClickListener {
            button1OnClick?.invoke()
        }

        button2ImageView.setOnClickListener {
            button2OnClick?.invoke()
        }
    }

    fun refresh() {
        contentTextView.setLines(1)
        contentTextView.ellipsize = TextUtils.TruncateAt.END

        when (rowType) {
            RowType.PHONE -> {
                button1ImageView.visibility = View.VISIBLE
                button1ImageView.setImageResource(R.drawable.ic_message)
                button2ImageView.visibility = View.VISIBLE
                button2ImageView.setImageResource(R.drawable.ic_phone)
            }
            RowType.FAX -> {
                button1ImageView.visibility = View.GONE
                button2ImageView.visibility = View.GONE

            }
            RowType.WEBSITE -> {
                button1ImageView.visibility = View.VISIBLE
                button1ImageView.setImageResource(R.drawable.ic_navigate_web)
                button2ImageView.visibility = View.GONE
            }
            RowType.EMAIL -> {
                button1ImageView.visibility = View.VISIBLE
                button1ImageView.setImageResource(R.drawable.ic_email)
                button2ImageView.visibility = View.GONE
            }
            RowType.ADDRESS -> {
                button1ImageView.visibility = View.VISIBLE
                button1ImageView.setImageResource(R.drawable.ic_location)
                button2ImageView.visibility = View.GONE
                contentTextView.setLines(0)
                contentTextView.maxLines = 10
                contentTextView.ellipsize = null
            }
        }
    }

    enum class RowType(val value: Int) {
        PHONE(0),
        FAX(1),
        EMAIL(2),
        WEBSITE(3),
        ADDRESS(4);

        companion object {
            private val map = HashMap<Int, RowType>()

            init {
                RowType.values().map { map.put(it.value, it) }
            }

            fun from(i: Int): RowType = try {
                map[i] ?: PHONE
            } catch (ex: Throwable) {
                PHONE

            }
        }
    }
}
