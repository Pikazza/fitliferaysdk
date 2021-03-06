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

package com.fiternity.service;

import com.liferay.portal.kernel.bean.PortletBeanLocatorUtil;
import com.liferay.portal.kernel.util.ReferenceRegistry;
import com.liferay.portal.service.InvokableLocalService;

/**
 * Provides the local service utility for Fiternity. This utility wraps
 * {@link com.fiternity.service.impl.FiternityLocalServiceImpl} and is the
 * primary access point for service operations in application layer code running
 * on the local server. Methods of this service will not have security checks
 * based on the propagated JAAS credentials because this service can only be
 * accessed from within the same VM.
 *
 * @author prabakaran
 * @see FiternityLocalService
 * @see com.fiternity.service.base.FiternityLocalServiceBaseImpl
 * @see com.fiternity.service.impl.FiternityLocalServiceImpl
 * @generated
 */
public class FiternityLocalServiceUtil {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify this class directly. Add custom service methods to {@link com.fiternity.service.impl.FiternityLocalServiceImpl} and rerun ServiceBuilder to regenerate this class.
	 */

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	public static java.lang.String getBeanIdentifier() {
		return getService().getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	public static void setBeanIdentifier(java.lang.String beanIdentifier) {
		getService().setBeanIdentifier(beanIdentifier);
	}

	public static java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return getService().invokeMethod(name, parameterTypes, arguments);
	}

	/**
	* It will get all the studios from database.
	*
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getStudioListing()
		throws com.fiternity.UnknownException {
		return getService().getStudioListing();
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
	public static java.lang.String addStudio(java.lang.String studio)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addStudio(studio);
	}

	/**
	* It will search all the studios from given studio list by calling web services where it meets search criteria.
	*
	* @param searchString A string that has to be searched in the database
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String studioSearch(java.lang.String searchString)
		throws com.fiternity.UnknownException {
		return getService().studioSearch(searchString);
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
	public static java.lang.String editStudio(java.lang.String studio)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().editStudio(studio);
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
	public static java.lang.String getStudioDetails(java.lang.String stdId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getStudioDetails(stdId);
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
	public static java.lang.String getRewardListing(java.lang.String stdId,
		java.lang.String RewardType, java.lang.String searchQuery)
		throws com.fiternity.UnknownException {
		return getService().getRewardListing(stdId, RewardType, searchQuery);
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
	public static java.lang.String getRewardDetails(java.lang.String rewardId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getRewardDetails(rewardId);
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
	public static java.lang.String addReward(java.lang.String reward)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addReward(reward);
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
	public static java.lang.String editReward(java.lang.String reward)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().editReward(reward);
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
	public static java.lang.String addVoucher(java.lang.String voucher)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addVoucher(voucher);
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
	public static java.lang.String addRewardVoucher(
		java.lang.String rewardVoucher)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addRewardVoucher(rewardVoucher);
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
	public static java.lang.String getActivityListing(java.lang.String stdId,
		java.lang.String activityType, java.lang.String activityStatus,
		java.lang.String searchQuery) throws com.fiternity.UnknownException {
		return getService()
				   .getActivityListing(stdId, activityType, activityStatus,
			searchQuery);
	}

	/**
	* Returns client response that has list of participants who are interested in specific activity(challenges/events) based on passed activity id.
	*
	* @param staId A activity Id for accessing specific data set.
	* @param searchQuery A string used for searching participants by their name.
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getInterestedParticipants(
		java.lang.String staId, java.lang.String searchQuery)
		throws com.fiternity.UnknownException {
		return getService().getInterestedParticipants(staId, searchQuery);
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
	public static java.lang.String selectWinner(java.lang.String winner)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().selectWinner(winner);
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
	public static java.lang.String getActivityDetails(java.lang.String actId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getActivityDetails(actId);
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
	public static java.lang.String addStudioActivity(
		java.lang.String studioActivity)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addStudioActivity(studioActivity);
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
	public static java.lang.String editStudioActivity(
		java.lang.String studioActivity)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().editStudioActivity(studioActivity);
	}

	/**
	* It will get all the adverts(promos and upsells) by calling web services.
	*
	* @param searchQuery A string that has to be searched in the database.
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getAdvertsListing(
		java.lang.String searchQuery) throws com.fiternity.UnknownException {
		return getService().getAdvertsListing(searchQuery);
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
	public static java.lang.String addAdverts(java.lang.String adverts)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().addAdverts(adverts);
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
	public static java.lang.String editAdverts(java.lang.String adverts)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().editAdverts(adverts);
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
	public static java.lang.String getAdvertDetails(java.lang.String offId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getAdvertDetails(offId);
	}

	/**
	* It will get all the parties by calling web services.
	*
	* @param searchString A string that has to be searched in the database.
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getPartyListing(
		java.lang.String searchString) throws com.fiternity.UnknownException {
		return getService().getPartyListing(searchString);
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
	public static java.lang.String getPartyDetails(java.lang.String ptyId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getPartyDetails(ptyId);
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
	public static java.lang.String editPartyStatus(java.lang.String party)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().editPartyStatus(party);
	}

	/**
	* It will get all the beacons by calling web services.
	*
	* @param searchString A string that has to be searched in the database.
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getBeaconsListing(
		java.lang.String searchString) throws com.fiternity.UnknownException {
		return getService().getBeaconsListing(searchString);
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
	public static java.lang.String getBeaconDetails(java.lang.String beaId,
		java.lang.String stdId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getBeaconDetails(beaId, stdId);
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
	public static java.lang.String saveBeacon(java.lang.String beacon)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().saveBeacon(beacon);
	}

	/**
	* It will get all the app's notification content by calling web services.
	*
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getNotificationListing()
		throws com.fiternity.UnknownException {
		return getService().getNotificationListing();
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
	public static java.lang.String saveNotification(java.lang.String notify)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().saveNotification(notify);
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
	public static java.lang.String getNotificationDetails(
		java.lang.String notifyType)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getNotificationDetails(notifyType);
	}

	/**
	* It will get all the restaurant by calling web services.
	*
	* @param searchString A string that has to be searched in the database.
	* @exception UnknownException throws runtime exception.
	* @return response of web service.
	*/
	public static java.lang.String getFuelsListing(
		java.lang.String searchString) throws com.fiternity.UnknownException {
		return getService().getFuelsListing(searchString);
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
	public static java.lang.String getFuelDetails(java.lang.String resId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().getFuelDetails(resId);
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
	public static java.lang.String saveFuel(java.lang.String restaurant)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		return getService().saveFuel(restaurant);
	}

	public static void clearService() {
		_service = null;
	}

	public static FiternityLocalService getService() {
		if (_service == null) {
			InvokableLocalService invokableLocalService = (InvokableLocalService)PortletBeanLocatorUtil.locate(ClpSerializer.getServletContextName(),
					FiternityLocalService.class.getName());

			if (invokableLocalService instanceof FiternityLocalService) {
				_service = (FiternityLocalService)invokableLocalService;
			}
			else {
				_service = new FiternityLocalServiceClp(invokableLocalService);
			}

			ReferenceRegistry.registerReference(FiternityLocalServiceUtil.class,
				"_service");
		}

		return _service;
	}

	/**
	 * @deprecated As of 6.2.0
	 */
	public void setService(FiternityLocalService service) {
	}

	private static FiternityLocalService _service;
}