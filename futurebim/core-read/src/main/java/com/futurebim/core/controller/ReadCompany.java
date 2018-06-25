package com.futurebim.core.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.futurebim.core.model.Company;
import com.futurebim.core.model.ui.FutureBimUiRestResponse;
import com.futurebim.core.dao.CompanyDao;

@RestController
@RequestMapping(path = "/company/read")
public class ReadCompany {
  
  private CompanyDao companyDao;
  
  @Autowired(required=true)
  public void setPersonService(CompanyDao companyDao){
    this.companyDao = companyDao;
  }

  @RequestMapping(value = "/all", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public @ResponseBody FutureBimUiRestResponse readAll(){
    
    return FutureBimUiRestResponse.createDataResponse(companyDao.listCountries());
  }

  @RequestMapping(value = "/get/{companyid}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
  public @ResponseBody FutureBimUiRestResponse getCompany(@PathVariable Long companyid){
    
    return FutureBimUiRestResponse.createDataResponse(companyDao.getById(companyid));
  }
  
  
}
