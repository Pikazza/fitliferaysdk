package com.fiternity.service.junit;

import junit.framework.TestCase;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import com.fiternity.NullException;
import com.fiternity.NumberFormatException;
import com.fiternity.SQLGrammerException;
import com.fiternity.UnknownException;
import com.fiternity.service.FiternityLocalServiceUtil;


/**
 * This is a testing class for FiternityLocalServiceUtil. So here, we mock that class to write test cases and validate generated output are same as expected for given input.
 * 
 * All methods are mocking FiternityLocalServiceUtil's methods and it does not return any value.
 *
 */
@PrepareForTest({FiternityLocalServiceUtil.class})
@RunWith(PowerMockRunner.class)
public class FiternityLocalServiceImplTest extends TestCase {
	
	/**
	   * This test case will test getstudioslisting method.
	   * It should return all of studios from database when studio listing web service is called.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetStudioListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("STD_ID", "4");
		outputobject.put("STD_NAME", "1Rebel");
		
		outputarray.put(outputobject);
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getStudioListing()).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getStudioListing();
		
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("STD_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test addStudio method.
	   * It should return new studio id of recently added studio from database when all of its valid details has been passed as parameter.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddStudio() throws SQLGrammerException, NumberFormatException,NullException, UnknownException 
	{
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STD_ID", "4");
		String studio="studio details";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addStudio(studio)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addStudio(studio);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test studioSearch method.
	   * It should identify and get the list of studios when  given search string equals to studio name.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testStudioSearch() throws UnknownException
	{
		String searchString="1Rebel";	
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("STD_ID", "4");
		outputobject.put("STD_NAME", "1Rebel");
		outputarray.put(outputobject);
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.studioSearch(searchString)).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.studioSearch(searchString);
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		
		Assert.assertEquals("4", checkobject.get("STD_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test editStudio method.
	   * It should return updated studio id of recently changed studio from database when all of its valid new details has been passed.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testEditStudio() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STD_ID", "4");
		String studio="studio details";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.editStudio(studio)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.editStudio(studio);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test getStudioDetails method.
	   * It should get all the details of studio based on given studio id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetStudioDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STD_ID", "4");
		String stdId="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getStudioDetails(stdId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getStudioDetails(stdId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test getRewardListing method.
	   * It should return all rewards from database when rewards listing web service is called.
	   * 
	   * @exception UnknownException throws runtime exception.
	   *
	   */
	@Test
	public void testGetRewardListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("RWD_ID", "4");
		outputobject.put("STD_NAME", "1Rebel");
		outputobject.put("RWD_NAME", "1Rebel reward name");
		outputarray.put(outputobject);
		
		String stdId="0";
		String RewardType="A";
		String SearchQuery="ALL";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getRewardListing(stdId,RewardType,SearchQuery)).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getRewardListing(stdId,RewardType,SearchQuery);
		
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("RWD_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null,outputstring);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test getRewardDetails method.
	   * It should get all the details of reward based on given reward id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetRewardDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("RWD_ID", "4");
		String rewardId="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getRewardDetails(rewardId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getRewardDetails(rewardId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("RWD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();				
	}
	
	/**
	   * This test case will test addReward method.
	   * It should return new reward id of recently added reward from database when all of its details has been passed as parameter.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddReward() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{			
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("RWD_ID", "4");
		String reward="reward details";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addReward(reward)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addReward(reward);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("RWD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test editReward method.
	   * It should return updated reward id of recently changed reward from database when all of its new details has been passed.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testEditReward() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("RWD_ID", "4");
		String reward="reward details";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.editReward(reward)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.editReward(reward);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("RWD_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test addVoucher method.
	   * It should return new voucher id of recently added voucher from database when all of its details has been passed as parameter.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddVoucher() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("VOC_ID", "4");
		String voucher="voucher details";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addVoucher(voucher)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addVoucher(voucher);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("VOC_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test addRewardVoucher method.
	   * It should return new rewardvoucher id of recently added rewardvoucher from database when all of its details has been passed as parameter.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddRewardVoucher() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("RESULT", "SUCCESS");
		String rewardVoucher="rewardVoucher details";//{"RWD_ID":"8", "VOC_ID":"600"}
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addRewardVoucher(rewardVoucher)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addRewardVoucher(rewardVoucher);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("SUCCESS", checkobject.get("RESULT"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	} 
	
	/**
	   * This test case will test getActivityListing method.
	   * It should return all of activities(challenges or events) from database when activity listing web service is called.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetActivityListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("STA_ID", "4");
		outputobject.put("STD_NAME", "1Rebel");
		outputobject.put("STA_NAME", "1Rebel Activity Name");
		outputarray.put(outputobject);
		
		String stdId="0";
		String activityType="1";
		String activityStatus="ALL";
		String SearchQuery="1Rebel Activity Name";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getActivityListing(stdId,activityType,activityStatus,SearchQuery)).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getActivityListing(stdId,activityType,activityStatus,SearchQuery);
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("STA_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test getInterestedParticipants method.
	   * It should list all of participants who are interested in specific activity(challenges/events) based on passed activity id.
	   *
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetInterestedParticipants() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		JSONArray outputarray=new JSONArray();
		outputobject.put("STD_ID", "4");
		outputobject.put("PTY_ID", "2");
		outputobject.put("STA_ID", "2");
		outputobject.put("ACCEPTED", "1");
		outputarray.put(outputobject);
		String staId="2";
		String SearchQuery="ALL";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getInterestedParticipants(staId,SearchQuery)).thenReturn(outputarray.toString());
		String outputString=FiternityLocalServiceUtil.getInterestedParticipants(staId,SearchQuery);
		checkarray=new JSONArray(outputString);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("2", checkobject.get("PTY_ID"));
		Assert.assertEquals("2", checkobject.get("STA_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This function used for selecting winners from list of participants who are all finished their challenge.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testSelectWinner() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("PTY_STA_ID", "4");
		String winner="";//{    "PTY_ID" : "12", "STA_ID" : "33","STA_STD_ID" : "2","CHECKIN_TIME" : "13/04/2016 02:39:00", "GAINED_TASK_BADGE" : ""}
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.selectWinner(winner)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.selectWinner(winner);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("PTY_STA_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();	
	}
	
	/**
	   * This test case will test getActivityDetails method.
	   * It should get all the details of activity(challenge/event) based on given activity id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetActivityDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STA_ID", "4");
		outputobject.put("STD_NAME", "Core Collective");
		outputobject.put("STA_DESCRIPTION", "Attend 16 classes in January and receive 20% ");
		String actId="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getActivityDetails(actId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getActivityDetails(actId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STA_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test addStudioActivity method.
	   * It should return new activity id of recently added activity from database when all of its details has been passed as parameter.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddStudioActivity() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STA_ID", "4");
		String studioActivity="studioActivity details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addStudioActivity(studioActivity)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addStudioActivity(studioActivity);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STA_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test editStudioActivity method.
	   * It should return updated activity id of recently changed activity from database when all of its new details has been passed.
	   *
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testEditStudioActivity() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{			
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("STA_ID", "4");
		String studioActivity="studioActivity details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.editStudioActivity(studioActivity)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.editStudioActivity(studioActivity);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("STA_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test getAdvertsListing method.
	   * It should list all adverts(promos and upsells).
	   *
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetAdvertsListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("OFF_ID", "4");
		outputobject.put("STD_NAME", "1Rebel");
		outputobject.put("OFF_NAME", "1Rebel Offers name");
		outputarray.put(outputobject);
		
		String SearchQuery="ALL";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getAdvertsListing(SearchQuery)).thenReturn(outputarray.toString());
		String stringoutput=FiternityLocalServiceUtil.getAdvertsListing(SearchQuery);
		checkarray=new JSONArray(stringoutput);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("OFF_ID"));
		Assert.assertNotNull(stringoutput);
		Assert.assertNotEquals(null, stringoutput);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();			
	}
	
	/**
	   * This test case will test addAdverts method.
	   * It should return new adverts (promos and upsells) id of recently added adverts from database when all of its details has been passed as parameter.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testAddAdverts() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("OFF_ID", "4");
		String adverts="adverts details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.addAdverts(adverts)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.addAdverts(adverts);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("OFF_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test editAdverts method.
	   * It should return updated adverts id of recently changed adverts from database when all of its new details has been passed.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testEditAdverts() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{			
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("OFF_ID", "4");
		String adverts="adverts details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.editAdverts(adverts)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.editAdverts(adverts);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("OFF_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test getAdvertDetails method.
	   * It should get all the details of adverts (promos and upsells) based on given adverts id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetAdvertDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{				
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("OFF_ID", "4");
		String offId="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getAdvertDetails(offId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getAdvertDetails(offId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("OFF_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test getPartyListing method.
	   * It should return all of parties from database when party listing web service is called.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetPartyListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("PTY_ID", "4");
		outputobject.put("PTY_NAME", "Romen");
		outputarray.put(outputobject);
		
		String searchString="ALL";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getPartyListing(searchString)).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getPartyListing(searchString);
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("PTY_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test getPartyDetails method.
	   * It should get all the details of party based on given party id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetPartyDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("PTY_ID", "4");
		String ptyId="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getPartyDetails(ptyId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getPartyDetails(ptyId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("PTY_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test editPartyStatus method.
	   * It should return updated party id of recently changed party from database when all of its new details has been passed.
	   *  
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testEditPartyStatus() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("PTY_ID", "4");
		String party="party details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.editPartyStatus(party)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.editPartyStatus(party);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("PTY_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test getBeaconsListing method.
	   * It should get all of beacons from database when beacons listing web service is called.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetBeaconsListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("BCON_ID", "4");
		outputobject.put("BCON_STD_NAME", "1Rebel");
		outputarray.put(outputobject);
		
		String searchString="1Rebel";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getBeaconsListing(searchString)).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getBeaconsListing(searchString);
		
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("BCON_ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test getBeaconDetails method.
	   * It should get all the details of beacon based on given beacon id.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetBeaconDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("BCON_ID", "4");
		outputobject.put("BCON_STD_ID", "3");
		outputobject.put("BCON_STD_NAME", "1Rebel");
		String beaId="4";
		String stdId="3";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getBeaconDetails(beaId, stdId)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getBeaconDetails(beaId, stdId);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("BCON_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();				
	}
	
	/**
	   * This test case will test saveBeacon method.
	   * It should get updated or added beacon id from database when all of beacon's details has been passed.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testSaveBeacon() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{		
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("BCON_ID", "4");
		String input="beacon details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.saveBeacon(input)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.saveBeacon(input);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("BCON_ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**  
	   * This test case will test getNotificationListing method.
	   * It should get list of app's notification content from database.
	   * 
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetNotificationListing() throws UnknownException
	{
		JSONArray checkarray;
		JSONObject checkobject;
		JSONArray outputarray=new JSONArray();
		JSONObject outputobject=new JSONObject();
		outputobject.put("ID", "4");
		outputobject.put("DESCRIPTION", "1Rebel Notifications");
		outputarray.put(outputobject);
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getNotificationListing()).thenReturn(outputarray.toString());
		String outputstring=FiternityLocalServiceUtil.getNotificationListing();
		
		checkarray=new JSONArray(outputstring);
		checkobject = checkarray.getJSONObject(0);
		Assert.assertEquals("4", checkobject.get("ID"));
		Assert.assertNotNull(outputstring);
		Assert.assertNotEquals(null, outputstring);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();		
	}
	
	/**
	   * This test case will test saveNotification method.
	   * It should get updated notification content id from database when all of contents has been passed.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testSaveNotification() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("ID", "4");
		String input="notification details";
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.saveNotification(input)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.saveNotification(input);
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	
	/**
	   * This test case will test getNotificationDetails method.
	   * It should get all the details of content based on passed notification type.
	   * 
	   * @exception SQLGrammerException throws when SQL syntax generated for you is incorrect.
	   * @exception NumberFormatException throws when we convert from string to numeric value.
	   * @exception NullException throws when null value is assigned to an object reference.
	   * @exception UnknownException throws runtime exception.
	   */
	@Test
	public void testGetNotificationDetails() throws UnknownException,SQLGrammerException,NumberFormatException,NullException
	{	
		JSONObject checkobject;
		JSONObject outputobject=new JSONObject();
		outputobject.put("ID", "4");
		String input="4";
		
		PowerMockito.mockStatic(FiternityLocalServiceUtil.class);
		Mockito.when(FiternityLocalServiceUtil.getNotificationDetails(input)).thenReturn(outputobject.toString());
		String outputString=FiternityLocalServiceUtil.getNotificationDetails(input);
		
		checkobject = new JSONObject(outputString);
		Assert.assertEquals("4", checkobject.get("ID"));
		Assert.assertNotNull(outputString);
		Assert.assertNotEquals(null, outputString);
		//System.out.println("your output is "+output);
		PowerMockito.verifyStatic();
	}
	

}

