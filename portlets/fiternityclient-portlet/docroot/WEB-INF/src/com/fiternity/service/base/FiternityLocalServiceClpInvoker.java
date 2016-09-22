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

package com.fiternity.service.base;

import com.fiternity.service.FiternityLocalServiceUtil;

import java.util.Arrays;

/**
 * @author prabakaran
 * @generated
 */
public class FiternityLocalServiceClpInvoker {
	public FiternityLocalServiceClpInvoker() {
		_methodName14 = "getBeanIdentifier";

		_methodParameterTypes14 = new String[] {  };

		_methodName15 = "setBeanIdentifier";

		_methodParameterTypes15 = new String[] { "java.lang.String" };

		_methodName20 = "getStudioListing";

		_methodParameterTypes20 = new String[] {  };

		_methodName21 = "addStudio";

		_methodParameterTypes21 = new String[] { "java.lang.String" };

		_methodName22 = "studioSearch";

		_methodParameterTypes22 = new String[] { "java.lang.String" };

		_methodName23 = "editStudio";

		_methodParameterTypes23 = new String[] { "java.lang.String" };

		_methodName24 = "getStudioDetails";

		_methodParameterTypes24 = new String[] { "java.lang.String" };

		_methodName25 = "getRewardListing";

		_methodParameterTypes25 = new String[] {
				"java.lang.String", "java.lang.String", "java.lang.String"
			};

		_methodName26 = "getRewardDetails";

		_methodParameterTypes26 = new String[] { "java.lang.String" };

		_methodName27 = "addReward";

		_methodParameterTypes27 = new String[] { "java.lang.String" };

		_methodName28 = "editReward";

		_methodParameterTypes28 = new String[] { "java.lang.String" };

		_methodName29 = "addVoucher";

		_methodParameterTypes29 = new String[] { "java.lang.String" };

		_methodName30 = "addRewardVoucher";

		_methodParameterTypes30 = new String[] { "java.lang.String" };

		_methodName31 = "getActivityListing";

		_methodParameterTypes31 = new String[] {
				"java.lang.String", "java.lang.String", "java.lang.String",
				"java.lang.String"
			};

		_methodName32 = "getInterestedParticipants";

		_methodParameterTypes32 = new String[] {
				"java.lang.String", "java.lang.String"
			};

		_methodName33 = "selectWinner";

		_methodParameterTypes33 = new String[] { "java.lang.String" };

		_methodName34 = "getActivityDetails";

		_methodParameterTypes34 = new String[] { "java.lang.String" };

		_methodName35 = "addStudioActivity";

		_methodParameterTypes35 = new String[] { "java.lang.String" };

		_methodName36 = "editStudioActivity";

		_methodParameterTypes36 = new String[] { "java.lang.String" };

		_methodName37 = "getAdvertsListing";

		_methodParameterTypes37 = new String[] { "java.lang.String" };

		_methodName38 = "addAdverts";

		_methodParameterTypes38 = new String[] { "java.lang.String" };

		_methodName39 = "editAdverts";

		_methodParameterTypes39 = new String[] { "java.lang.String" };

		_methodName40 = "getAdvertDetails";

		_methodParameterTypes40 = new String[] { "java.lang.String" };

		_methodName41 = "getPartyListing";

		_methodParameterTypes41 = new String[] { "java.lang.String" };

		_methodName42 = "getPartyDetails";

		_methodParameterTypes42 = new String[] { "java.lang.String" };

		_methodName43 = "editPartyStatus";

		_methodParameterTypes43 = new String[] { "java.lang.String" };

		_methodName44 = "getBeaconsListing";

		_methodParameterTypes44 = new String[] { "java.lang.String" };

		_methodName45 = "getBeaconDetails";

		_methodParameterTypes45 = new String[] {
				"java.lang.String", "java.lang.String"
			};

		_methodName46 = "saveBeacon";

		_methodParameterTypes46 = new String[] { "java.lang.String" };

		_methodName47 = "getNotificationListing";

		_methodParameterTypes47 = new String[] {  };

		_methodName48 = "saveNotification";

		_methodParameterTypes48 = new String[] { "java.lang.String" };

		_methodName49 = "getNotificationDetails";

		_methodParameterTypes49 = new String[] { "java.lang.String" };

		_methodName50 = "getFuelsListing";

		_methodParameterTypes50 = new String[] { "java.lang.String" };

		_methodName51 = "getFuelDetails";

		_methodParameterTypes51 = new String[] { "java.lang.String" };

		_methodName52 = "saveFuel";

		_methodParameterTypes52 = new String[] { "java.lang.String" };
	}

	public Object invokeMethod(String name, String[] parameterTypes,
		Object[] arguments) throws Throwable {
		if (_methodName14.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes14, parameterTypes)) {
			return FiternityLocalServiceUtil.getBeanIdentifier();
		}

		if (_methodName15.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes15, parameterTypes)) {
			FiternityLocalServiceUtil.setBeanIdentifier((java.lang.String)arguments[0]);

			return null;
		}

		if (_methodName20.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes20, parameterTypes)) {
			return FiternityLocalServiceUtil.getStudioListing();
		}

		if (_methodName21.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes21, parameterTypes)) {
			return FiternityLocalServiceUtil.addStudio((java.lang.String)arguments[0]);
		}

		if (_methodName22.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes22, parameterTypes)) {
			return FiternityLocalServiceUtil.studioSearch((java.lang.String)arguments[0]);
		}

		if (_methodName23.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes23, parameterTypes)) {
			return FiternityLocalServiceUtil.editStudio((java.lang.String)arguments[0]);
		}

		if (_methodName24.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes24, parameterTypes)) {
			return FiternityLocalServiceUtil.getStudioDetails((java.lang.String)arguments[0]);
		}

		if (_methodName25.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes25, parameterTypes)) {
			return FiternityLocalServiceUtil.getRewardListing((java.lang.String)arguments[0],
				(java.lang.String)arguments[1], (java.lang.String)arguments[2]);
		}

		if (_methodName26.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes26, parameterTypes)) {
			return FiternityLocalServiceUtil.getRewardDetails((java.lang.String)arguments[0]);
		}

		if (_methodName27.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes27, parameterTypes)) {
			return FiternityLocalServiceUtil.addReward((java.lang.String)arguments[0]);
		}

		if (_methodName28.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes28, parameterTypes)) {
			return FiternityLocalServiceUtil.editReward((java.lang.String)arguments[0]);
		}

		if (_methodName29.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes29, parameterTypes)) {
			return FiternityLocalServiceUtil.addVoucher((java.lang.String)arguments[0]);
		}

		if (_methodName30.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes30, parameterTypes)) {
			return FiternityLocalServiceUtil.addRewardVoucher((java.lang.String)arguments[0]);
		}

		if (_methodName31.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes31, parameterTypes)) {
			return FiternityLocalServiceUtil.getActivityListing((java.lang.String)arguments[0],
				(java.lang.String)arguments[1], (java.lang.String)arguments[2],
				(java.lang.String)arguments[3]);
		}

		if (_methodName32.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes32, parameterTypes)) {
			return FiternityLocalServiceUtil.getInterestedParticipants((java.lang.String)arguments[0],
				(java.lang.String)arguments[1]);
		}

		if (_methodName33.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes33, parameterTypes)) {
			return FiternityLocalServiceUtil.selectWinner((java.lang.String)arguments[0]);
		}

		if (_methodName34.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes34, parameterTypes)) {
			return FiternityLocalServiceUtil.getActivityDetails((java.lang.String)arguments[0]);
		}

		if (_methodName35.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes35, parameterTypes)) {
			return FiternityLocalServiceUtil.addStudioActivity((java.lang.String)arguments[0]);
		}

		if (_methodName36.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes36, parameterTypes)) {
			return FiternityLocalServiceUtil.editStudioActivity((java.lang.String)arguments[0]);
		}

		if (_methodName37.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes37, parameterTypes)) {
			return FiternityLocalServiceUtil.getAdvertsListing((java.lang.String)arguments[0]);
		}

		if (_methodName38.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes38, parameterTypes)) {
			return FiternityLocalServiceUtil.addAdverts((java.lang.String)arguments[0]);
		}

		if (_methodName39.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes39, parameterTypes)) {
			return FiternityLocalServiceUtil.editAdverts((java.lang.String)arguments[0]);
		}

		if (_methodName40.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes40, parameterTypes)) {
			return FiternityLocalServiceUtil.getAdvertDetails((java.lang.String)arguments[0]);
		}

		if (_methodName41.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes41, parameterTypes)) {
			return FiternityLocalServiceUtil.getPartyListing((java.lang.String)arguments[0]);
		}

		if (_methodName42.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes42, parameterTypes)) {
			return FiternityLocalServiceUtil.getPartyDetails((java.lang.String)arguments[0]);
		}

		if (_methodName43.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes43, parameterTypes)) {
			return FiternityLocalServiceUtil.editPartyStatus((java.lang.String)arguments[0]);
		}

		if (_methodName44.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes44, parameterTypes)) {
			return FiternityLocalServiceUtil.getBeaconsListing((java.lang.String)arguments[0]);
		}

		if (_methodName45.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes45, parameterTypes)) {
			return FiternityLocalServiceUtil.getBeaconDetails((java.lang.String)arguments[0],
				(java.lang.String)arguments[1]);
		}

		if (_methodName46.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes46, parameterTypes)) {
			return FiternityLocalServiceUtil.saveBeacon((java.lang.String)arguments[0]);
		}

		if (_methodName47.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes47, parameterTypes)) {
			return FiternityLocalServiceUtil.getNotificationListing();
		}

		if (_methodName48.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes48, parameterTypes)) {
			return FiternityLocalServiceUtil.saveNotification((java.lang.String)arguments[0]);
		}

		if (_methodName49.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes49, parameterTypes)) {
			return FiternityLocalServiceUtil.getNotificationDetails((java.lang.String)arguments[0]);
		}

		if (_methodName50.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes50, parameterTypes)) {
			return FiternityLocalServiceUtil.getFuelsListing((java.lang.String)arguments[0]);
		}

		if (_methodName51.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes51, parameterTypes)) {
			return FiternityLocalServiceUtil.getFuelDetails((java.lang.String)arguments[0]);
		}

		if (_methodName52.equals(name) &&
				Arrays.deepEquals(_methodParameterTypes52, parameterTypes)) {
			return FiternityLocalServiceUtil.saveFuel((java.lang.String)arguments[0]);
		}

		throw new UnsupportedOperationException();
	}

	private String _methodName14;
	private String[] _methodParameterTypes14;
	private String _methodName15;
	private String[] _methodParameterTypes15;
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
	private String _methodName36;
	private String[] _methodParameterTypes36;
	private String _methodName37;
	private String[] _methodParameterTypes37;
	private String _methodName38;
	private String[] _methodParameterTypes38;
	private String _methodName39;
	private String[] _methodParameterTypes39;
	private String _methodName40;
	private String[] _methodParameterTypes40;
	private String _methodName41;
	private String[] _methodParameterTypes41;
	private String _methodName42;
	private String[] _methodParameterTypes42;
	private String _methodName43;
	private String[] _methodParameterTypes43;
	private String _methodName44;
	private String[] _methodParameterTypes44;
	private String _methodName45;
	private String[] _methodParameterTypes45;
	private String _methodName46;
	private String[] _methodParameterTypes46;
	private String _methodName47;
	private String[] _methodParameterTypes47;
	private String _methodName48;
	private String[] _methodParameterTypes48;
	private String _methodName49;
	private String[] _methodParameterTypes49;
	private String _methodName50;
	private String[] _methodParameterTypes50;
	private String _methodName51;
	private String[] _methodParameterTypes51;
	private String _methodName52;
	private String[] _methodParameterTypes52;
}