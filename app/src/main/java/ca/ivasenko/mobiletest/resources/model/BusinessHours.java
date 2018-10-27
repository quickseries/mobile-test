package ca.ivasenko.mobiletest.resources.model;

public class BusinessHours
{
    private Sunday sunday;
    private Monday monday;
    private Tuesday tuesday;
    private Wednesday wednesday;
    private Thursday thursday;
    private Friday friday;
    private Saturday saturday;

    public BusinessHours()
    {
    }

    public Sunday getSunday()
    {
        return sunday;
    }

    public void setSunday(Sunday sunday)
    {
        this.sunday = sunday;
    }

    public Monday getMonday()
    {
        return monday;
    }

    public void setMonday(Monday monday)
    {
        this.monday = monday;
    }

    public Tuesday getTuesday()
    {
        return tuesday;
    }

    public void setTuesday(Tuesday tuesday)
    {
        this.tuesday = tuesday;
    }

    public Wednesday getWednesday()
    {
        return wednesday;
    }

    public void setWednesday(Wednesday wednesday)
    {
        this.wednesday = wednesday;
    }

    public Thursday getThursday()
    {
        return thursday;
    }

    public void setThursday(Thursday thursday)
    {
        this.thursday = thursday;
    }

    public Friday getFriday()
    {
        return friday;
    }

    public void setFriday(Friday friday)
    {
        this.friday = friday;
    }

    public Saturday getSaturday()
    {
        return saturday;
    }

    public void setSaturday(Saturday saturday)
    {
        this.saturday = saturday;
    }
}
