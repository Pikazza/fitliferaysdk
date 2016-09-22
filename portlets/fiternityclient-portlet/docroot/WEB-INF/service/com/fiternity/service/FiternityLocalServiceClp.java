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

import com.liferay.portal.service.InvokableLocalService;

/**
 * @author prabakaran
 * @generated
 */
public class FiternityLocalServiceClp implements FiternityLocalService {
	public FiternityLocalServiceClp(InvokableLocalService invokableLocalService) {
		_invokableLocalService = invokableLocalService;

		_methodName0 = "getBeanIdentifier";

		_methodParameterTypes0 = new String[] {  };

		_methodName1 = "setBeanIdentifier";

		_methodParameterTypes1 = new String[] { "java.lang.String" };

		_methodName3 = "getStudioListing";

		_methodParameterTypes3 = new String[] {  };

		_methodName4 = "addStudio";

		_methodParameterTypes4 = new String[] { "java.lang.String" };

		_methodName5 = "studioSearch";

		_methodParameterTypes5 = new String[] { "java.lang.String" };

		_methodName6 = "editStudio";

		_methodParameterTypes6 = new String[] { "java.lang.String" };

		_methodName7 = "getStudioDetails";

		_methodParameterTypes7 = new String[] { "java.lang.String" };

		_methodName8 = "getRewardListing";

		_methodParameterTypes8 = new String[] {
				"java.lang.String", "java.lang.String", "java.lang.String"
			};

		_methodName9 = "getRewardDetails";

		_methodParameterTypes9 = new String[] { "java.lang.String" };

		_methodName10 = "addReward";

		_methodParameterTypes10 = new String[] { "java.lang.String" };

		_methodName11 = "editReward";

		_methodParameterTypes11 = new String[] { "java.lang.String" };

		_methodName12 = "addVoucher";

		_methodParameterTypes12 = new String[] { "java.lang.String" };

		_methodName13 = "addRewardVoucher";

		_methodParameterTypes13 = new String[] { "java.lang.String" };

		_methodName14 = "getActivityListing";

		_methodParameterTypes14 = new String[] {
				"java.lang.String", "java.lang.String", "java.lang.String",
				"java.lang.String"
			};

		_methodName15 = "getInterestedParticipants";

		_methodParameterTypes15 = new String[] {
				"java.lang.String", "java.lang.String"
			};

		_methodName16 = "selectWinner";

		_methodParameterTypes16 = new String[] { "java.lang.String" };

		_methodName17 = "getActivityDetails";

		_methodParameterTypes17 = new String[] { "java.lang.String" };

		_methodName18 = "addStudioActivity";

		_methodParameterTypes18 = new String[] { "java.lang.String" };

		_methodName19 = "editStudioActivity";

		_methodParameterTypes19 = new String[] { "java.lang.String" };

		_methodName20 = "getAdvertsListing";

		_methodParameterTypes20 = new String[] { "java.lang.String" };

		_methodName21 = "addAdverts";

		_methodParameterTypes21 = new String[] { "java.lang.String" };

		_methodName22 = "editAdverts";

		_methodParameterTypes22 = new String[] { "java.lang.String" };

		_methodName23 = "getAdvertDetails";

		_methodParameterTypes23 = new String[] { "java.lang.String" };

		_methodName24 = "getPartyListing";

		_methodParameterTypes24 = new String[] { "java.lang.String" };

		_methodName25 = "getPartyDetails";

		_methodParameterTypes25 = new String[] { "java.lang.String" };

		_methodName26 = "editPartyStatus";

		_methodParameterTypes26 = new String[] { "java.lang.String" };

		_methodName27 = "getBeaconsListing";

		_methodParameterTypes27 = new String[] { "java.lang.String" };

		_methodName28 = "getBeaconDetails";

		_methodParameterTypes28 = new String[] {
				"java.lang.String", "java.lang.String"
			};

		_methodName29 = "saveBeacon";

		_methodParameterTypes29 = new String[] { "java.lang.String" };

		_methodName30 = "getNotificationListing";

		_methodParameterTypes30 = new String[] {  };

		_methodName31 = "saveNotification";

		_methodParameterTypes31 = new String[] { "java.lang.String" };

		_methodName32 = "getNotificationDetails";

		_methodParameterTypes32 = new String[] { "java.lang.String" };

		_methodName33 = "getFuelsListing";

		_methodParameterTypes33 = new String[] { "java.lang.String" };

		_methodName34 = "getFuelDetails";

		_methodParameterTypes34 = new String[] { "java.lang.String" };

		_methodName35 = "saveFuel";

		_methodParameterTypes35 = new String[] { "java.lang.String" };
	}

	@Override
	public java.lang.String getBeanIdentifier() {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName0,
					_methodParameterTypes0, new Object[] {  });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public void setBeanIdentifier(java.lang.String beanIdentifier) {
		try {
			_invokableLocalService.invokeMethod(_methodName1,
				_methodParameterTypes1,
				new Object[] { ClpSerializer.translateInput(beanIdentifier) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}
	}

	@Override
	public java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		throw new UnsupportedOperationException();
	}

	@Override
	public java.lang.String getStudioListing()
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName3,
					_methodParameterTypes3, new Object[] {  });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addStudio(java.lang.String studio)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName4,
					_methodParameterTypes4,
					new Object[] { ClpSerializer.translateInput(studio) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String studioSearch(java.lang.String searchString)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName5,
					_methodParameterTypes5,
					new Object[] { ClpSerializer.translateInput(searchString) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String editStudio(java.lang.String studio)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName6,
					_methodParameterTypes6,
					new Object[] { ClpSerializer.translateInput(studio) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getStudioDetails(java.lang.String stdId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName7,
					_methodParameterTypes7,
					new Object[] { ClpSerializer.translateInput(stdId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getRewardListing(java.lang.String stdId,
		java.lang.String RewardType, java.lang.String searchQuery)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName8,
					_methodParameterTypes8,
					new Object[] {
						ClpSerializer.translateInput(stdId),
						
					ClpSerializer.translateInput(RewardType),
						
					ClpSerializer.translateInput(searchQuery)
					});
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getRewardDetails(java.lang.String rewardId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName9,
					_methodParameterTypes9,
					new Object[] { ClpSerializer.translateInput(rewardId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addReward(java.lang.String reward)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName10,
					_methodParameterTypes10,
					new Object[] { ClpSerializer.translateInput(reward) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String editReward(java.lang.String reward)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName11,
					_methodParameterTypes11,
					new Object[] { ClpSerializer.translateInput(reward) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addVoucher(java.lang.String voucher)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName12,
					_methodParameterTypes12,
					new Object[] { ClpSerializer.translateInput(voucher) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addRewardVoucher(java.lang.String rewardVoucher)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName13,
					_methodParameterTypes13,
					new Object[] { ClpSerializer.translateInput(rewardVoucher) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getActivityListing(java.lang.String stdId,
		java.lang.String activityType, java.lang.String activityStatus,
		java.lang.String searchQuery) throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName14,
					_methodParameterTypes14,
					new Object[] {
						ClpSerializer.translateInput(stdId),
						
					ClpSerializer.translateInput(activityType),
						
					ClpSerializer.translateInput(activityStatus),
						
					ClpSerializer.translateInput(searchQuery)
					});
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getInterestedParticipants(java.lang.String staId,
		java.lang.String searchQuery) throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName15,
					_methodParameterTypes15,
					new Object[] {
						ClpSerializer.translateInput(staId),
						
					ClpSerializer.translateInput(searchQuery)
					});
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String selectWinner(java.lang.String winner)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName16,
					_methodParameterTypes16,
					new Object[] { ClpSerializer.translateInput(winner) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getActivityDetails(java.lang.String actId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName17,
					_methodParameterTypes17,
					new Object[] { ClpSerializer.translateInput(actId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addStudioActivity(java.lang.String studioActivity)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName18,
					_methodParameterTypes18,
					new Object[] { ClpSerializer.translateInput(studioActivity) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String editStudioActivity(java.lang.String studioActivity)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName19,
					_methodParameterTypes19,
					new Object[] { ClpSerializer.translateInput(studioActivity) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getAdvertsListing(java.lang.String searchQuery)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName20,
					_methodParameterTypes20,
					new Object[] { ClpSerializer.translateInput(searchQuery) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String addAdverts(java.lang.String adverts)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName21,
					_methodParameterTypes21,
					new Object[] { ClpSerializer.translateInput(adverts) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String editAdverts(java.lang.String adverts)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName22,
					_methodParameterTypes22,
					new Object[] { ClpSerializer.translateInput(adverts) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getAdvertDetails(java.lang.String offId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName23,
					_methodParameterTypes23,
					new Object[] { ClpSerializer.translateInput(offId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getPartyListing(java.lang.String searchString)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName24,
					_methodParameterTypes24,
					new Object[] { ClpSerializer.translateInput(searchString) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getPartyDetails(java.lang.String ptyId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName25,
					_methodParameterTypes25,
					new Object[] { ClpSerializer.translateInput(ptyId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String editPartyStatus(java.lang.String party)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName26,
					_methodParameterTypes26,
					new Object[] { ClpSerializer.translateInput(party) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getBeaconsListing(java.lang.String searchString)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName27,
					_methodParameterTypes27,
					new Object[] { ClpSerializer.translateInput(searchString) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getBeaconDetails(java.lang.String beaId,
		java.lang.String stdId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName28,
					_methodParameterTypes28,
					new Object[] {
						ClpSerializer.translateInput(beaId),
						
					ClpSerializer.translateInput(stdId)
					});
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String saveBeacon(java.lang.String beacon)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName29,
					_methodParameterTypes29,
					new Object[] { ClpSerializer.translateInput(beacon) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getNotificationListing()
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName30,
					_methodParameterTypes30, new Object[] {  });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String saveNotification(java.lang.String notify)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName31,
					_methodParameterTypes31,
					new Object[] { ClpSerializer.translateInput(notify) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getNotificationDetails(java.lang.String notifyType)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName32,
					_methodParameterTypes32,
					new Object[] { ClpSerializer.translateInput(notifyType) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getFuelsListing(java.lang.String searchString)
		throws com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName33,
					_methodParameterTypes33,
					new Object[] { ClpSerializer.translateInput(searchString) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String getFuelDetails(java.lang.String resId)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName34,
					_methodParameterTypes34,
					new Object[] { ClpSerializer.translateInput(resId) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	@Override
	public java.lang.String saveFuel(java.lang.String restaurant)
		throws com.fiternity.NullException, com.fiternity.NumberFormatException,
			com.fiternity.SQLGrammerException, com.fiternity.UnknownException {
		Object returnObj = null;

		try {
			returnObj = _invokableLocalService.invokeMethod(_methodName35,
					_methodParameterTypes35,
					new Object[] { ClpSerializer.translateInput(restaurant) });
		}
		catch (Throwable t) {
			t = ClpSerializer.translateThrowable(t);

			if (t instanceof com.fiternity.NullException) {
				throw (com.fiternity.NullException)t;
			}

			if (t instanceof com.fiternity.NumberFormatException) {
				throw (com.fiternity.NumberFormatException)t;
			}

			if (t instanceof com.fiternity.SQLGrammerException) {
				throw (com.fiternity.SQLGrammerException)t;
			}

			if (t instanceof com.fiternity.UnknownException) {
				throw (com.fiternity.UnknownException)t;
			}

			if (t instanceof RuntimeException) {
				throw (RuntimeException)t;
			}
			else {
				throw new RuntimeException(t.getClass().getName() +
					" is not a valid exception");
			}
		}

		return (java.lang.String)ClpSerializer.translateOutput(returnObj);
	}

	private InvokableLocalService _invokableLocalService;
	private String _methodName0;
	private String[] _methodParameterTypes0;
	private String _methodName1;
	private String[] _methodParameterTypes1;
	private String _methodName3;
	private String[] _methodParameterTypes3;
	private String _methodName4;
	private String[] _methodParameterTypes4;
	private String _methodName5;
	private String[] _methodParameterTypes5;
	private String _methodName6;
	private String[] _methodParameterTypes6;
	private String _methodName7;
	private String[] _methodParameterTypes7;
	private String _methodName8;
	private String[] _methodParameterTypes8;
	private String _methodName9;
	private String[] _methodParameterTypes9;
	private String _methodName10;
	private String[] _methodParameterTypes10;
	private String _methodName11;
	private String[] _methodParameterTypes11;
	private String _methodName12;
	private String[] _methodParameterTypes12;
	private String _methodName13;
	private String[] _methodParameterTypes13;
	private String _methodName14;
	private String[] _methodParameterTypes14;
	private String _methodName15;
	private String[] _methodParameterTypes15;
	private String _methodName16;
	private String[] _methodParameterTypes16;
	private String _methodName17;
	private String[] _methodParameterTypes17;
	private String _methodName18;
	private String[] _methodParameterTypes18;
	private String _methodName19;
	private String[] _methodParameterTypes19;
	private String _methodName20;
	private String[] _methodParameterTypes20;
	private String _methodName21;
	private String[] _methodParameterTypes21;
	private String _methodName22;
	private String[] _methodParameterTypes22;
	private String _methodName23;
	private String[] _methodParameterTypes23;
	private String _methodName24;
	private String[] _methodParameterTypes24;
	private String _methodName25;
	private String[] _methodParameterTypes25;
	private String _methodName26;
	private String[] _methodParameterTypes26;
	private String _methodName27;
	private String[] _methodParameterTypes27;
	private String _methodName28;
	private String[] _methodParameterTypes28;
	private String _methodName29;
	private String[] _methodParameterTypes29;
	private String _methodName30;
	private String[] _methodParameterTypes30;
	private String _methodName31;
	private String[] _methodParameterTypes31;
	private String _methodName32;
	private String[] _methodParameterTypes32;
	private String _methodName33;
	private String[] _methodParameterTypes33;
	private String _methodName34;
	private String[] _methodParameterTypes34;
	private String _methodName35;
	private String[] _methodParameterTypes35;
}