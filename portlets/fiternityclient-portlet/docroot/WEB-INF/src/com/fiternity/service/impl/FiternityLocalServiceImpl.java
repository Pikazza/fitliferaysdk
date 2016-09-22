/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.fiternity.service.impl;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriBuilder;

import org.glassfish.jersey.internal.util.Base64;

import com.fiternity.NullException;
import com.fiternity.NumberFormatException;
import com.fiternity.SQLGrammerException;
import com.fiternity.UnknownException;
import com.fiternity.service.base.FiternityLocalServiceBaseImpl;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.util.portlet.PortletProps;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * The implementation of the fiternity local service.
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the {@link com.fiternity.service.FiternityLocalService} interface.
 * This class is generated based on service-builder portlet.
 * 
 * Each methods in this class acting like a client and consuming restful web service from Fiternity App server. it will not work as expected if there is no app server,or it is not working properly.
 * 
 * All of this methods actions are determined.So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object (Studio,Reward,etc.,) throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 * 
 * @author prabakaran
 * @see com.fiternity.service.base.FiternityLocalServiceBaseImpl
 * @see com.fiternity.service.FiternityLocalServiceUtil
 */
public class FiternityLocalServiceImpl extends FiternityLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this interface directly. Always use {@link com.fiternity.service.FiternityLocalServiceUtil} to access the fiternity local service.
	 */
	
	private static Log _log=LogFactoryUtil.getLog(FiternityLocalServiceImpl.class);
	private static final String FIT_URL = PortletProps.get("fiternity-base-url");
	private static final String CONTEXT_PATH = PortletProps.get("fiternity-context-path");
	private static final String AUTHORIZATION_CODE = PortletProps.get("server.authorization.code");
	public static final String AUTH_NAME_KEY = "Basic "+Base64.encodeAsString(AUTHORIZATION_CODE);
	public static final String _ERROR_UNKNOWN=PortletProps.get("unknown.error.msg");
	public static final String _ERROR_NULL_POINTER=PortletProps.get("nullpointer.error.msg");
	public static final String _ERROR_NUMBER_FORMAT=PortletProps.get("numberformat.error.msg");
	public static final String _ERROR_SQL_GRAMMER=PortletProps.get("sqlgrammer.error.msg");
	
	/**
	   * This is a common function used for validating client response status code and do actions accordingly.
	   * It will be invoked by all other methods except listing methods.
	   * 
	   * @param clientResponse An response object that has all information sent from a web service end point.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	String exceptionForSave(ClientResponse clientResponse ) throws SQLGrammerException, NumberFormatException, UnknownException, NullException{
		 String responsejson = StringPool.BLANK;
		 _log.info(">>>>>>>>>>"+clientResponse.getStatus());
		 _log.info(">>>>>>>>>>"+clientResponse.toString());
		 switch(clientResponse.getStatus()){
		 
			case 200:  responsejson = clientResponse.getEntity(String.class); 
			   break;
			case 201:  responsejson = clientResponse.getEntity(String.class); 
			   break;
			case 404:  throw new SQLGrammerException(_ERROR_SQL_GRAMMER); 
			   
			case 803:  throw new NumberFormatException(_ERROR_NUMBER_FORMAT);
				
			case 804:  throw new NullException(_ERROR_NULL_POINTER);
			default : 
				throw new UnknownException(_ERROR_UNKNOWN);
			}
		return responsejson;
	}
	
	/**
	   * This is a common function used for validating client response status code and do actions accordingly.
	   * It will be invoked by all listing methods.
	   * 
	   * @param clientResponse An response object that has all information sent from a web service end point.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	String exceptionForListing(ClientResponse clientResponse ) throws  UnknownException{
		 String responsejson = StringPool.BLANK;
		 _log.info(">>>>>>>>>>"+clientResponse.getStatus());
		 _log.info(">>>>>>>>>>"+clientResponse.toString());
		 switch(clientResponse.getStatus()){
		 
			case 200:  responsejson = clientResponse.getEntity(String.class); 
			   break;
			case 201:  responsejson = clientResponse.getEntity(String.class); 
			   break;
			default : 
				throw new UnknownException(_ERROR_UNKNOWN);
			}
		return responsejson;
	}
	
	/**
	   * It will get all the studios from database.
	   * 
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getStudioListing() throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("studios/status/ALL");
		ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
	                .get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;			
	}
	
	/**
	   * Returns client response that holds status of studio insertion.
	   * 
	   * @param studio It contains all the details of studio. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addStudio(String studio) throws SQLGrammerException, NumberFormatException,NullException, UnknownException 
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveStudio");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, studio);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;	
	}
	
	/**
	   * It will search all the studios from given studio list by calling web services where it meets search criteria.
	   * 
	   * @param searchString A string that has to be searched in the database
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String studioSearch(String searchString) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("studioSearch/").path(searchString);
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
				 .get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;	
	}
	
	/**
	   * Returns client response that holds status of studio updation.
	   * 
	   * @param studio It contains all the details of studio. So it can be updated into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String editStudio(String studio) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveStudio");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
				   .post(ClientResponse.class, studio);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;	
	}
	
	/**
	   * Returns client response that holds details of studio based on passed studio id.
	   * 
	   * @param stdId A studio Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getStudioDetails(String stdId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("studioDetails/").path(stdId);
		ClientResponse clientResponse = webResource.accept("application/json").header("Authorization", AUTH_NAME_KEY)
		           .get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;	
	}
	
	/**
	   * It will get all the rewards by calling web services based on given parameter studio id, reward type and search query.
	   * 
	   * @param stdId A studio Id for listing rewards of it own.
	   * @param RewardType A string the holds types of reward (current reward or expired reward).
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getRewardListing(String stdId,String RewardType,String searchQuery) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("rewardSearch/").path("rwdname/").path(searchQuery).path("/stdid/").path(stdId).path("/type/").path(RewardType);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
	                .get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds details of reward based on passed reward id.
	   * 
	   * @param rewardId A reward Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getRewardDetails(String rewardId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("rewardDetails/rewardid/").path(rewardId);
		ClientResponse clientResponse = webResource.accept("application/json").header("Authorization", AUTH_NAME_KEY)
		           .get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;	
	}
	
	/**
	   * Returns client response that holds status of reward insertion.
	   * 
	   * @param reward It contains all the details of reward. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addReward(String reward) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveReward");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, reward);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;	
	}
	
	/**
	   * Returns client response that holds status of reward updation.
	   * 
	   * @param reward It contains all the details of reward. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String editReward(String reward) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveReward");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, reward);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;
	}
	
	/**
	   * Returns client response that holds status of voucher insertion.
	   * 
	   * @param voucher It contains all the details of voucher. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addVoucher(String voucher) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("addVoucher");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, voucher);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;
	}
	
	/**
	   * Returns client response that holds status of voucher insertion.
	   * 
	   * @param rewardVoucher It contains all the details of rewardVoucher. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addRewardVoucher(String rewardVoucher) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("addRewardVoucher");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, rewardVoucher);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;
	} 
	
	/**
	   * It will get all the Activities(challenges,events) by calling web services based on given parameter studio id, activity type(challenges or events), activityStatus (current Activity or expired Activity) and search query.
	   * 
	   * @param stdId A studio Id for listing activities of it own.
	   * @param activityType A string the holds types of Activity (challenges or events).
	   * @param activityStatus A string the holds current status of Activity (current Activity or expired Activity).
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getActivityListing(String stdId,String activityType,String activityStatus,String searchQuery) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("activitySearch/").path("name/").path(searchQuery).path("/status/").path(activityStatus).path("/type/").path(activityType).path("/stdid/").path(stdId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
	                .get(ClientResponse.class);
		 responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that has list of participants who are interested in specific activity(challenges/events) based on passed activity id.
	   * 
	   * @param staId A activity Id for accessing specific data set.
	   * @param searchQuery A string used for searching participants by their name.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getInterestedParticipants(String staId,String searchQuery) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("participants/").path("name/").path(searchQuery).path("/staid/").path(staId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
	                .get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;				
	}
	
	/**
	   * This function used for selecting winners from list of participants who are all finished their challenge.
	   * 
	   * @param winner It contains all the details of winner. So it can be updated into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String selectWinner(String winner) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("selectWinner");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, winner);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds details of activity(challenges/events) based on passed activity id.
	   * 
	   * @param actId A activity Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getActivityDetails(String actId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("activityDetail/").path("activityid/").path(actId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON).header("Authorization", AUTH_NAME_KEY)
	                .get(ClientResponse.class);		 
		responsejson= exceptionForSave(clientResponse);
		return responsejson;				
	}
	
	/**
	   * Returns client response that holds status of activity insertion.
	   * 
	   * @param studioActivity It contains all the details of activity. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addStudioActivity(String studioActivity) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveStudioActivity");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, studioActivity);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds status of studio's activity updation.
	   * 
	   * @param studioActivity It contains all the details of activity. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String editStudioActivity(String studioActivity) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveStudioActivity");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, studioActivity);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * It will get all the adverts(promos and upsells) by calling web services.
	   * 
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getAdvertsListing(String searchQuery) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("offersSearch/").path("ofrname/").path(searchQuery);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON)
				 .header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		 
		responsejson= exceptionForListing(clientResponse);
		return responsejson;
				
	}
	
	/**
	   * Returns client response that holds adverts (promos and upsells) insertion.
	   * 
	   * @param adverts It contains all the details of adverts. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String addAdverts(String adverts) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveOffers");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, adverts);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;
	}
	
	/**
	   * Returns client response that holds status of adverts (promos and upsells) updation.
	   * 
	   * @param adverts It contains all the details of adverts. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String editAdverts(String adverts) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveOffers");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, adverts);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds details of adverts based on passed adverts id.
	   * 
	   * @param offId A adverts (promos and upsells) Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getAdvertDetails(String offId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("offersDetails/").path("ofrId/").path(offId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON)
				 .header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;				
	}
	
	/**
	   * It will get all the parties by calling web services.
	   * 
	   * @param searchString A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getPartyListing(String searchString) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("partySearch/search/").path(searchString);
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds details of customer based on passed party id.
	   * 
	   * @param ptyId A party(customer) Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getPartyDetails(String ptyId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("partyDetails/partyid/").path(ptyId);
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds status of party updation.
	   * 
	   * @param party It contains all the details of party. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String editPartyStatus(String party) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("changeUserStatus");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, party);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * It will get all the beacons by calling web services.
	   * 
	   * @param searchString A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getBeaconsListing(String searchString) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("beacons/search/").path(searchString);
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	
	/**
	   * Returns client response that holds details of beacons based on passed beacon id.
	   * 
	   * @param beaId A beacon Id for accessing specific data set.
	   * @param stdId A studio Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getBeaconDetails(String beaId,String stdId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("beaconDetail/").path("bconid/").path(beaId).path("/stdid/").path(stdId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON)
				 .header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;				
	}
	
	/**
	   * Returns client response that holds beacons details for beacon insertion and updation.
	   * 
	   * @param beacon It contains all the details of beacons. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String saveBeacon(String beacon) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveBeacon");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, beacon);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	
	/**
	   * It will get all the app's notification content by calling web services.
	   * 
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getNotificationListing() throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("listinfo");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds notification content details for content updation.
	   * 
	   * @param notify It contains all the details of notification. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String saveNotification(String notify) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveInfo");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, notify);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
	/**
	   * Returns client response that holds details of content based on passed notification type.
	   * 
	   * @param notifyType A studio Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getNotificationDetails(String notifyType) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("infoDetail/").path("type/").path(notifyType);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON)
				 .header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;				
	}
	
	/**
	   * It will get all the restaurant by calling web services.
	   * 
	   * @param searchString A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getFuelsListing(String searchString) throws UnknownException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("restaurant/status/").path(searchString);
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForListing(clientResponse);
		return responsejson;		
	}
	
	/**
	   * Returns client response that holds details of restaurant based on passed restaurant id.
	   * 
	   * @param resId A restaurant Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service. 
	   */
	public String getFuelDetails(String resId) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("restaurant/").path(resId);
		 ClientResponse clientResponse = webResource.accept(MediaType.APPLICATION_JSON)
				 .header("Authorization", AUTH_NAME_KEY).get(ClientResponse.class);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;				
	}
	
	/**
	   * Returns client response that holds restaurant details for beacon insertion and updation.
	   * 
	   * @param beacon It contains all the details of beacons. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return response of web service call. 
	   */
	public String saveFuel(String restaurant) throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		String responsejson = StringPool.BLANK;
		Client client = Client.create();
		WebResource webResource = client.resource(UriBuilder.fromUri(FIT_URL).build()).path(CONTEXT_PATH).path("saveRestaurant");
		ClientResponse clientResponse = webResource.type(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)
				.header("Authorization", AUTH_NAME_KEY).post(ClientResponse.class, restaurant);
		responsejson= exceptionForSave(clientResponse);
		return responsejson;		
	}
}