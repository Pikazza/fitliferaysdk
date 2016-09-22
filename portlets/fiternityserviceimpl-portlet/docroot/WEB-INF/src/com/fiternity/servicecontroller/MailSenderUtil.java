package com.fiternity.servicecontroller;

import com.liferay.mail.service.MailServiceUtil;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portlet.journal.model.JournalArticle;
import com.liferay.portlet.journal.service.JournalArticleLocalServiceUtil;
import com.liferay.util.portlet.PortletProps;

import javax.mail.internet.InternetAddress;


/**
 * MailSenderUtil class contain a static method which can be used for sending emails to people who are all involved in that action as a notification .
 * 
 */
public class MailSenderUtil  
{
	public static final String TO_ADDRESS=PortletProps.get("toaddress");
	public static final String ADVERTS_EMAIL_CONTENT_ID=PortletProps.get("adverts.email.article.id");
	public static final String ADVERTS_EMAIL_SUBJECT=PortletProps.get("adverts.email.subject");
	public static final String EVENT_EMAIL_CONTENT_ID=PortletProps.get("events.email.article.id");
	public static final String EVENT_EMAIL_SUBJECT=PortletProps.get("events.email.subject");
	public static final String CHALLENGE_EMAIL_CONTENT_ID=PortletProps.get("challenges.email.article.id");
	public static final String CHALLENGE_EMAIL_SUBJECT=PortletProps.get("challenges.email.subject");
	public static final String MODERATOR_EMAIL_CONTENT_ID=PortletProps.get("moderators.email.article.id");
	public static final String MODERATOR_EMAIL_SUBJECT=PortletProps.get("moderators.email.subject");
	public static final String REWARD_EMAIL_CONTENT_ID=PortletProps.get("rewards.email.article.id");
	public static final String REWARD_EMAIL_SUBJECT=PortletProps.get("rewards.email.subject");

	
	/**
	   * This method will send mail when new event is created.
	   * 
	   * @param groupId It refers site id.
	   * @param emailId An email will be sent to given email id.
	   * @param eveName Event name that will be added into mail content.
	   * @param stdName Studio name that will be added into mail content.
	   * @exception Exception A runtime exception.
	   */
	public static void mailForEvent(long groupId ,String emailId ,String eveName,String stdName  ) throws Exception {
		InternetAddress fromAddress = new InternetAddress();
		fromAddress.setAddress(PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);
		InternetAddress toAddress = new InternetAddress(); 
		toAddress.setAddress(emailId);
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,EVENT_EMAIL_CONTENT_ID);
		String finalbody=StringUtil.replace(body.getContent(), 
				new String[] { "[$EVENT_NAME$]", "[$STUDIO_NAME$]","]]>"}, 
				new String[] { eveName, stdName,"" });
		
		MailMessage message = new MailMessage(fromAddress, toAddress,
				EVENT_EMAIL_SUBJECT,finalbody, true);

		MailServiceUtil.sendEmail(message);

	}
	
	/**
	   * This method will send mail when new adverts(promos and upsells) is created.
	   * 
	   * @param groupId It refers site id.
	   * @param emailId An email will be sent to given email id.
	   * @param offType adverts type that will be added into mail content.
	   * @param stdName Studio name that will be added into mail content.
	   * @exception Exception A runtime exception.
	   */
	public static void mailForAdvert(long groupId ,String emailId ,String offType,String stdName  ) throws Exception {
		InternetAddress fromAddress = new InternetAddress();
		fromAddress.setAddress(PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);
		InternetAddress toAddress = new InternetAddress(); 
		toAddress.setAddress(emailId);
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,ADVERTS_EMAIL_CONTENT_ID);
		String finalbody=StringUtil.replace(body.getContent(), 
				new String[] { "[$OFFER_TYPE$]", "[$STUDIO_NAME$]","]]>"}, 
				new String[] { offType, stdName,"" });
		
		MailMessage message = new MailMessage(fromAddress, toAddress,
				ADVERTS_EMAIL_SUBJECT,finalbody, true);

		MailServiceUtil.sendEmail(message);

	}
	
	/**
	   * This method will send mail when new challenge is created.
	   * 
	   * @param groupId It refers site id.
	   * @param emailId An email will be sent to given email id.
	   * @param cheName challenge name that will be added into mail content.
	   * @param stdName Studio name that will be added into mail content.
	   * @exception Exception A runtime exception.
	   */
	public static void mailForChallenge(long groupId ,String emailId ,String cheName,String stdName  ) throws Exception {
		InternetAddress fromAddress = new InternetAddress();
		fromAddress.setAddress(PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);
		InternetAddress toAddress = new InternetAddress(); 
		toAddress.setAddress(emailId);
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,CHALLENGE_EMAIL_CONTENT_ID);
		String finalbody=StringUtil.replace(body.getContent(), 
				new String[] { "[$CHALLENGE_NAME$]", "[$STUDIO_NAME$]","]]>"}, 
				new String[] { cheName, stdName,"" });
		
		MailMessage message = new MailMessage(fromAddress, toAddress,
				CHALLENGE_EMAIL_SUBJECT,finalbody, true);

		MailServiceUtil.sendEmail(message);

	}
	
	/**
	   * This method will send mail when new moderator is created.
	   * 
	   * @param groupId It refers site id.
	   * @param portalUrl Domain address referred for login location.
	   * @param emailId An user name of moderator.
	   * @param passWord A password of moderator.
	   * @exception Exception A runtime exception.
	   */
	public static void mailForModerator(long groupId,String portalUrl,String emailId ,String passWord  ) throws Exception {
		InternetAddress fromAddress = new InternetAddress();
		fromAddress.setAddress(PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);
		InternetAddress toAddress = new InternetAddress(); 
		toAddress.setAddress(emailId);
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,MODERATOR_EMAIL_CONTENT_ID);
		String finalbody=StringUtil.replace(body.getContentByLocale("en-US"), 
				new String[] {"[$PORTAL_URL$]", "[$TO_ADDRESS$]", "[$USER_PASSWORD$]","]]>"},
				new String[] {portalUrl, emailId, passWord,"" });
		
		MailMessage message = new MailMessage(fromAddress, toAddress,
				MODERATOR_EMAIL_SUBJECT,finalbody, true);

		MailServiceUtil.sendEmail(message);

	}
	
	/**
	   * This method will send mail when new reward is created.
	   * 
	   * @param groupId It refers site id.
	   * @param emailId An email will be sent to given email id.
	   * @param rwdName Reward name that will be added into mail content.
	   * @param stdName Studio name that will be added into mail content.
	   * @exception Exception A runtime exception.
	   */
	public static void mailForReward(long groupId ,String emailId ,String rwdName,String stdName ) throws Exception {
		InternetAddress fromAddress = new InternetAddress();
		fromAddress.setAddress(PropsKeys.ADMIN_EMAIL_FROM_ADDRESS);
		InternetAddress toAddress = new InternetAddress(); 
		toAddress.setAddress(emailId);
		
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,REWARD_EMAIL_CONTENT_ID);
		
		String finalbody=StringUtil.replace(body.getContent(), 
				new String[] { "[$REWARD_NAME$]", "[$STUDIO_NAME$]","]]>"}, 
				new String[] { rwdName, stdName,"" });

		
		MailMessage message = new MailMessage(fromAddress, toAddress,
				REWARD_EMAIL_SUBJECT,finalbody, true);

		MailServiceUtil.sendEmail(message);

	}

}