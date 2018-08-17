package com.quickseriestest.CategoryMain;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.quickseriestest.Login.LoginActivity;
import com.quickseriestest.R;
import com.quickseriestest.RestuarantMain.RestuarantActivity;
import com.quickseriestest.VacationSpotMain.VacationSpotActivity;
import com.quickseriestest.models.Category;

import java.util.List;


/**
 * Created by Vijen on 2018-08-16.
 */

public class CategoryActivity extends Activity implements CategoryView, AdapterView.OnItemClickListener {

    private ListView listView;
    private ProgressBar progressBar;
    private CategoryPresenter presenter;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_list);
        listView = (ListView) findViewById(R.id.list);
        listView.setOnItemClickListener(this);
        progressBar = (ProgressBar) findViewById(R.id.progress);
        presenter = new CategoryPresenterImpl(this, new CategoryInteractorImpl(this));
    }

    @Override protected void onResume() {
        super.onResume();
        presenter.onResume();
    }

    @Override public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu, menu);
        return true;
    }

    @Override public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_logout:
                startActivity(new Intent(this, LoginActivity.class));
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override protected void onDestroy() {
        presenter.onDestroy();
        super.onDestroy();
    }

    @Override public void showProgress() {
        progressBar.setVisibility(View.VISIBLE);
        listView.setVisibility(View.INVISIBLE);
    }

    @Override public void hideProgress() {
        progressBar.setVisibility(View.INVISIBLE);
        listView.setVisibility(View.VISIBLE);
    }

    @Override public void setCategory(List<Category> categories) {

        listView.setAdapter(new CategoryAdapter( categories,this));
    }

    @Override public void showMessage(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
        presenter.onItemClicked(position);
    }

    @Override public void navigateToRestuarant() {
        startActivity(new Intent(this, RestuarantActivity.class));
    }

    @Override public void navigateToVacationSpot() {
        startActivity(new Intent(this, VacationSpotActivity.class));
    }
}
