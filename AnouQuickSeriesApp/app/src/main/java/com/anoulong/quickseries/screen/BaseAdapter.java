package com.anoulong.quickseries.screen;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.SparseBooleanArray;
import android.view.LayoutInflater;

import com.annimon.stream.Stream;

import java.util.ArrayList;
import java.util.List;

import timber.log.Timber;

/**
 * Created by Anou on 2017-10-15.
 */

public abstract class BaseAdapter <T, U extends RecyclerView.ViewHolder> extends RecyclerView.Adapter<U> {

    private List<T> data;
    private Context context;
    private LayoutInflater inflater;

    private SparseBooleanArray selectedItems;

    protected BaseAdapter(Context context) {
        this(context, new ArrayList<T>());
    }

    protected BaseAdapter(Context context, List<T> data) {
        this.context = context;
        this.data = data;
        this.inflater = LayoutInflater.from(context);
        this.selectedItems = new SparseBooleanArray();
    }

    public void setData(List<T> data) {
        this.data = data;
        notifyDataSetChanged();
    }

    public void add(T element) {
        data.add(element);
        notifyDataSetChanged();
    }

    public void addAll(List<T> elements) {
        data.addAll(elements);
        notifyDataSetChanged();
    }

    public void remove(T element) {
        data.remove(element);
        notifyDataSetChanged();
    }

    public void remove(int position) {
        data.remove(position);
        notifyDataSetChanged();
    }

    public void clear() {
        data.clear();
        notifyDataSetChanged();
    }

    public boolean contains(T element) {
        return data.contains(element);
    }

    public int indexOf(T element) {
        return data.indexOf(element);
    }

    @Override
    public int getItemCount() {
        return data.size();
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    public T getItem(int position) {
        return data.get(position);
    }

    protected Context getContext() {
        return context;
    }

    public LayoutInflater getInflater() {
        return inflater;
    }

    public List<T> getData() {
        return data;
    }

    /**
     * Indicates if the item at position position is selected
     *
     * @param position Position of the item to check
     * @return true if the item is selected, false otherwise
     */
    public boolean isSelected(int position) {
        return getSelectedItemsPositions().contains(position);
    }

    /**
     * Toggle the selection status of the item at a given position
     *
     * @param position Position of the item to toggle the selection status for
     */
    public void toggleSelection(int position) {
        if (selectedItems.get(position, false)) {
            selectedItems.delete(position);
        } else {
            selectedItems.put(position, true);
        }
        notifyItemChanged(position);
    }

    /**
     * Select all items
     *
     */
    public void selectAll() {
        for (int i = 0; i < data.size(); i++) {
            selectedItems.put(i, true);
            notifyItemChanged(i);
        }
    }

    /**
     * Clear the selection status for all items
     */
    public void clearSelection() {
        List<Integer> selection = getSelectedItemsPositions();
        selectedItems.clear();
        for (Integer i : selection) {
            notifyItemChanged(i);
        }
    }

    /**
     * Count the selected items
     *
     * @return Selected items count
     */
    public int getSelectedItemCount() {
        Timber.d("getSelectedItemCount=" + selectedItems.size());
        return selectedItems.size();
    }

    /**
     * Indicates the list of selected items
     *
     * @return List of selected items ids
     */
    public List<Integer> getSelectedItemsPositions() {
        List<Integer> items = new ArrayList<>(selectedItems.size());
        for (int i = 0; i < selectedItems.size(); ++i) {
            items.add(selectedItems.keyAt(i));
        }
        return items;
    }

    public List<T> getSelectedItems() {
        List<T> selection = new ArrayList<T>();
        for (int i = 0; i < data.size(); i++) {
            if(isSelected(i)){
                selection.add(data.get(i));
            }
        }
        return selection;
    }

    public int getItemPosition(T element){
        int position = 0;

        if(contains(element)){
            for (T e : this.data) {
                if(e.equals(element)){
                    return position;
                }
                position++;
            }
        }

        return position;
    }

}
