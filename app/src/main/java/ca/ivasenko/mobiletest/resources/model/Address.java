package ca.ivasenko.mobiletest.resources.model;

public class Address
{
    private String address1;
    private String label;
    private String zipCode;
    private String city;
    private String state;
    private String country;
    private Gps gps;

    public Address()
    {
    }

    public String getAddress1()
    {
        return address1;
    }

    public void setAddress1(String address1)
    {
        this.address1 = address1;
    }

    public String getLabel()
    {
        return label;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public String getZipCode()
    {
        return zipCode;
    }

    public void setZipCode(String zipCode)
    {
        this.zipCode = zipCode;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    public Gps getGps()
    {
        return gps;
    }

    public void setGps(Gps gps)
    {
        this.gps = gps;
    }
}
