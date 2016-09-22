package com.fiternity.serviceimpl;





import org.springframework.stereotype.Service;

import com.fiternity.NumberFormException;
import com.fiternity.NumberFormatException;
import com.fiternity.NullException;
import com.fiternity.SQLGrammerException;
import com.fiternity.UnknownException;
import com.fiternity.service.FiternityLocalServiceUtil;
//import com.fiternity.service.impl.*;
import com.fiternity.service.FiternityService;

/**
 * This class is the implementation of FiternityService interface. So other portlets can access all of methods written in this class to manage app's database.
 * Methods in this class are all accessing static methods of FiternityLocalServiceUtil class and it will not be directly accessed.
 * 
 * Studios, Rewards, Challenges, Events and Notification portlets are some example which is dependent on this class.
 * 
 * Each portlets have their own listing,add,edit and get details method. All of it's logic are implemented here.
 * 
 * All of this methods actions are determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object (Studio,Reward,etc.,) throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 * 
 * @see FiternityLocalServiceUtil
 * @see FiternityService
 */
@Service
public class FiternityServiceImpl implements FiternityService {

	/**
	   * It will get all the studios from database.
	   * 
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String getStudiosListing() throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getStudioListing();
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of studio based on passed studio id.
	   * 
	   * @param stdId A studio Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getStudioDetails(String stdId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getStudioDetails(stdId);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of studio updation.
	   * 
	   * @param studio It contains all the details of studio. So it can be updated into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String editStudio(String studio) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {		
		String jsonresult= FiternityLocalServiceUtil.editStudio(studio);
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of studio insertion.
	   * 
	   * @param studio It contains all the details of studio. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addStudio(String studio) throws UnknownException, NumberFormatException, SQLGrammerException,NullException {
		
		String jsonresult= FiternityLocalServiceUtil.addStudio(studio);
		
		return jsonresult;
	}
	
	/**
	   * It will search all the studios from given studio list by calling web services where it meets search criteria.
	   * 
	   * @param searchString A string that has to be searched in the database
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String studioSearch(String searchString) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.studioSearch(searchString);
		
		return jsonresult;
	}
	
	/**
	   * It will get all the rewards by calling web services based on given parameter studio id, reward type and search query.
	   * 
	   * @param stdId A studio Id for listing rewards of it own.
	   * @param RewardType A string the holds types of reward (current reward or expired reward).
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getRewardsListing(String stdId,String RewardType,String searchQuery) throws UnknownException{
		
		String jsonresult= FiternityLocalServiceUtil.getRewardListing( stdId, RewardType, searchQuery);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of reward based on passed reward id.
	   * 
	   * @param rewardId A reward Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getRewardDetails(String rewardId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getRewardDetails(rewardId);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of reward insertion.
	   * 
	   * @param reward It contains all the details of reward. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addReward(String reward) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.addReward(reward);
		
		return jsonresult;
	}

	/**
	   * Returns client response that holds status of reward updation.
	   * 
	   * @param reward It contains all the details of reward. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String editReward(String reward) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.editReward(reward);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of voucher insertion.
	   * 
	   * @param voucher It contains all the details of voucher. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addVoucher(String voucher) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.addVoucher(voucher);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of voucher insertion.
	   * 
	   * @param rewardVoucher It contains all the details of rewardVoucher. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addRewardVoucher(String rewardVoucher) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		String jsonresult= FiternityLocalServiceUtil.addRewardVoucher(rewardVoucher);
		
		return jsonresult;
	}
	
	/**
	   * It will get all the Activities(challenges,events) by calling web services based on given parameter studio id, activity type(challenges or events), activityStatus (current Activity or expired Activity) and search query.
	   * 
	   * @param stdId A studio Id for listing activities of it own.
	   * @param activityType A string the holds types of Activity (challenges or events).
	   * @param activityStatus A string the holds current status of Activity (current Activity or expired Activity).
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getActivityListing(String stdId,String activityType,String activityStatus,String searchQuery) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getActivityListing(stdId, activityType, activityStatus, searchQuery);
		
		return jsonresult;
	}
	
	/**
	   * This function used for selecting winners from list of participants who are all finished their challenge.
	   * 
	   * @param winner It contains all the details of winner. So it can be updated into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String selectWinner(String winner) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.selectWinner(winner);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of activity(challenges/events) based on passed activity id.
	   * 
	   * @param actId A activity Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getActivityDetails(String actId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getActivityDetails(actId);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that has list of participants who are interested in specific activity(challenges/events) based on passed activity id.
	   * 
	   * @param stdId A studio Id for accessing specific data set.
	   * @param searchQuery A string used for searching participants by their name.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getInterestedParticipants(String stdId,String searchQuery) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getInterestedParticipants(stdId, searchQuery);
				
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of activity insertion.
	   * 
	   * @param challenge It contains all the details of activity. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addChallenge(String challenge) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.addStudioActivity(challenge);
		
		return jsonresult;
	}

	/**
	   * Returns client response that holds status of studio's activity updation.
	   * 
	   * @param challenge It contains all the details of activity. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String editChallenge(String challenge) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.editStudioActivity(challenge);
		
		return jsonresult;
	}
	
	/**
	   * It will get all the adverts(promos and upsells) by calling web services.
	   * 
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getAdvertsListing(String searchQuery) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getAdvertsListing(searchQuery);
				
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds adverts (promos and upsells) insertion.
	   * 
	   * @param advert It contains all the details of adverts. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String addAdvert(String advert) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.addAdverts(advert);
		
		return jsonresult;
	}

	/**
	   * Returns client response that holds status of adverts (promos and upsells) updation.
	   * 
	   * @param advert It contains all the details of adverts. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String editAdvert(String advert) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.editAdverts(advert);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of adverts based on passed adverts id.
	   * 
	   * @param ofrId A adverts (promos and upsells) Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getAdvertDetails(String ofrId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getAdvertDetails(ofrId);
				
		
		return jsonresult;
	}
	
	/**
	   * It will get all the parties by calling web services.
	   * 
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getCustomersListing(String searchQuery) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getPartyListing(searchQuery);
				
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of customer based on passed party id.
	   * 
	   * @param ptyId A party(customer) Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getCustomerDetails(String ptyId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getPartyDetails(ptyId);
				
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds status of party updation.
	   * 
	   * @param party It contains all the details of party. So it can be updated into database. 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String editCustomerStatus(String party) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.editPartyStatus(party);
		
		return jsonresult;
	}
	
	/**
	   * It will get all the beacons by calling web services.
	   * 
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getBeaconsListing(String searchQuery) throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getBeaconsListing(searchQuery);
				
		
		return jsonresult;
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
	   * @return String a response of web service. 
	   */
	@Override
	public String getBeaconDetails(String beaId,String stdId) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getBeaconDetails(beaId, stdId);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds beacons details for beacon insertion and updation.
	   * 
	   * @param beacon It contains all the details of beacons. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String saveBeacon(String beacon) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.saveBeacon(beacon);
		
		return jsonresult;
	}

	/**
	   * It will get all the app's notification content by calling web services.
	   * 
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getNotificationsListing() throws UnknownException {
		
		String jsonresult= FiternityLocalServiceUtil.getNotificationListing();
				
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of content based on passed notification type.
	   * 
	   * @param type A studio Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getNotificationDetails(String type) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.getNotificationDetails(type);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds notification content details for content updation.
	   * 
	   * @param notify It contains all the details of notification. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String saveNotification(String notify) throws UnknownException, NumberFormatException, SQLGrammerException, NullException {
		
		String jsonresult= FiternityLocalServiceUtil.saveNotification(notify);
		
		return jsonresult;
	}

	/**
	   * It will get all the restaurants by calling web services.
	   * 
	   * @param searchQuery A string that has to be searched in the database.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getFuelsListing(String searchQuery) throws UnknownException {
		String jsonresult= FiternityLocalServiceUtil.getFuelsListing(searchQuery);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds details of restaurant based on passed restaurant id.
	   * 
	   * @param resId A restaurant Id for accessing specific data set.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service. 
	   */
	@Override
	public String getFuelDetails(String resId) throws UnknownException,
			NumberFormatException, SQLGrammerException, NullException {
		String jsonresult= FiternityLocalServiceUtil.getFuelDetails(resId);
		
		return jsonresult;
	}
	
	/**
	   * Returns client response that holds restaurant details for beacon insertion and updation.
	   * 
	   * @param beacon It contains all the details of beacons. So it can be added into database.
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   * @return String a response of web service call. 
	   */
	@Override
	public String saveFuel(String restaurant) throws UnknownException,
			NumberFormatException, SQLGrammerException, NullException {
		String jsonresult= FiternityLocalServiceUtil.saveFuel(restaurant);
		
		return jsonresult;
	}

}
