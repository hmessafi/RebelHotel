// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.domain;

import java.lang.Integer;
import java.util.Date;

privileged aspect WorkEffortDuration_Roo_JavaBean {
    
    public Date WorkEffortDuration.getStartDate() {
        return this.startDate;
    }
    
    public void WorkEffortDuration.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date WorkEffortDuration.getEndDate() {
        return this.endDate;
    }
    
    public void WorkEffortDuration.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public Integer WorkEffortDuration.getHours() {
        return this.hours;
    }
    
    public void WorkEffortDuration.setHours(Integer hours) {
        this.hours = hours;
    }
    
}
