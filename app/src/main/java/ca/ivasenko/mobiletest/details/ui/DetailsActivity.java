package ca.ivasenko.mobiletest.details.ui;

import android.arch.lifecycle.Observer;
import android.arch.lifecycle.ViewModelProviders;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import ca.ivasenko.mobiletest.R;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;
import ca.ivasenko.mobiletest.resources.ui.ResourcesActivity;

public class DetailsActivity extends AppCompatActivity
{

    private ImageView imageView;
    private TextView objectTitle;
    private TextView objectDescription;
    private TextView email;
    private TextView phone;
    private TextView website;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        initViews();

        String categoryEid = getIntent().getStringExtra(ResourcesActivity.EID_EXTRA);
        int objectId = getIntent().getIntExtra(ResourcesActivity.RESOURCE_OBJECT_ID_EXTRA, 0);

        DetailsViewModel detailsViewModel = ViewModelProviders.of(this).get(DetailsViewModel.class);
        detailsViewModel.getResourceObject(objectId).observe(this, new Observer<ResourceObject>()
        {
            @Override
            public void onChanged(@Nullable ResourceObject resourceObject)
            {
                updateUI(resourceObject);
            }
        });


    }

    private void initViews()
    {
        imageView = findViewById(R.id.image);
        objectTitle = findViewById(R.id.objectTitle);
        objectDescription = findViewById(R.id.object_description);
        email = findViewById(R.id.description_email);
        phone = findViewById(R.id.description_phone);
        website = findViewById(R.id.description_website);

        LinearLayout emailRow = findViewById(R.id.email_row);
        emailRow.setOnClickListener(view ->
        {
            Intent intent = new Intent(Intent.ACTION_SENDTO);
            intent.setType("text/plain");
            intent.setData(Uri.parse("mailto:" + "email from the resource object"));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        });
    }

    private void updateUI(ResourceObject resourceObject)
    {
        Glide.with(getApplicationContext())
                .load(resourceObject.getPhoto())
                .into(imageView);
        objectTitle.setText(resourceObject.getTitle());
        String description = resourceObject.getDescription();
        if (description != null && !description.isEmpty())
            objectDescription.setText(Html.fromHtml(description).toString().trim());
    }
}
