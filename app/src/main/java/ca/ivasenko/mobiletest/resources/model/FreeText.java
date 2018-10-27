package ca.ivasenko.mobiletest.resources.model;

import java.util.List;

public class FreeText
{
    private List<String> text = null;

    public FreeText()
    {
    }

    public List<String> getText()
    {
        return text;
    }

    public void setText(List<String> text)
    {
        this.text = text;
    }
}
