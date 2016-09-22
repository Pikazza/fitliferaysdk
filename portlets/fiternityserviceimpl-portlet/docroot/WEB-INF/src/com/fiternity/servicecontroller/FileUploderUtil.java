package com.fiternity.servicecontroller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import javax.portlet.ActionRequest;
import javax.portlet.PortletException;

import com.fiternity.UnknownException;
import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.repository.model.FileEntry;
import com.liferay.portal.kernel.repository.model.Folder;
import com.liferay.portal.kernel.util.MimeTypesUtil;
import com.liferay.portal.model.ResourceAction;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.ResourcePermission;
import com.liferay.portal.model.Role;
import com.liferay.portal.security.permission.ActionKeys;
import com.liferay.portal.service.ResourceActionLocalServiceUtil;
import com.liferay.portal.service.ResourcePermissionLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.documentlibrary.DuplicateFileException;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.model.DLFolderConstants;
import com.liferay.portlet.documentlibrary.service.DLAppLocalServiceUtil;

/**
 * 
 * FileUploderUtil class contain a static method which can be used for uploading images into document and media library.
 * 
 *
 */
public class FileUploderUtil {
	
	/**
	   * This method will upload images into document and media library.
	   * 
	   * @param actionRequest An object sent to the portlet to handle a action.
	   * @param themeDisplay An Object that hold all information of liferay theme.
	   * @param folderName All the images to be stored in given folder name.
	   * @param file An file object.
	   * @param fileName Name of the file that has to be stored.
	   * @exception PortalException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception DuplicateFileException It will throw when uploading file is already exist.
	   * @exception FileNotFoundException It will throw when required file is not found.
	   * @return No return value.
	   */
	public static String fileUploadByApp(String folderName, ThemeDisplay themeDisplay,
			ActionRequest actionRequest,File file,String fileName) throws PortalException, SystemException, FileNotFoundException,DuplicateFileException {		
		
		long repositoryId = themeDisplay.getScopeGroupId();
		Long groupId = themeDisplay.getLayout().getGroupId();
		String mimeType = MimeTypesUtil.getContentType(file);
		String title = fileName.replaceAll("\\W", "");
		String description = file.getName();
		String changeLog = "Fiternity";
		long companyId=themeDisplay.getCompanyId();
		Long parentFolderId = DLFolderConstants.DEFAULT_PARENT_FOLDER_ID;
		Role role = RoleLocalServiceUtil.getRole(companyId, "Guest");
		long roleid=role.getRoleId();
		ResourcePermission resourcePermission = null;
		Folder folder = DLAppLocalServiceUtil.getFolder(
				themeDisplay.getScopeGroupId(), parentFolderId, folderName);
		ServiceContext serviceContext = ServiceContextFactory.getInstance(DLFileEntry.class.getName(), actionRequest);
		InputStream is = new FileInputStream(file);	
		try{
	FileEntry fileent = DLAppLocalServiceUtil.addFileEntry(themeDisplay.getUserId(), repositoryId, folder.getFolderId(), file.getName(), mimeType, title, description, changeLog, is, file.length(), serviceContext);
	String primeid=String.valueOf(fileent.getPrimaryKey());
	
	resourcePermission = ResourcePermissionLocalServiceUtil.createResourcePermission(CounterLocalServiceUtil.increment());
    resourcePermission.setCompanyId(companyId);
    resourcePermission.setName(DLFileEntry.class.getName());
    resourcePermission.setScope(ResourceConstants.SCOPE_INDIVIDUAL);
    resourcePermission.setPrimKey(String.valueOf(primeid));
    resourcePermission.setRoleId(roleid);
  
    ResourceAction resourceAction = ResourceActionLocalServiceUtil.getResourceAction(DLFileEntry.class.getName(), ActionKeys.VIEW);
    resourcePermission.setActionIds(resourceAction.getBitwiseValue());// (ActionKeys.VIEW);
    ResourcePermissionLocalServiceUtil.addResourcePermission(resourcePermission);
	
	String portalURL = PortalUtil.getPortalURL(actionRequest);
    String url = portalURL + "/c/document_library/get_file?uuid=" + fileent.getUuid() + "&groupId=" + fileent.getGroupId();
	return url;		
	}
		catch(Exception e){
			System.out.println("exception is "+e.toString());
			FileEntry fileEntry = DLAppLocalServiceUtil.getFileEntry(groupId, folder.getFolderId(), title);
			
			FileEntry fileent =DLAppLocalServiceUtil.updateFileEntry(themeDisplay.getUserId(), fileEntry.getFileEntryId(),file.getName(), 
					mimeType, title,
					description, changeLog,false, is, file.length(), serviceContext);
			
			String portalURL = PortalUtil.getPortalURL(actionRequest);
		    String url = portalURL + "/c/document_library/get_file?uuid=" + fileent.getUuid() + "&groupId=" + fileent.getGroupId();
			System.out.println("image path  after duplicate exception thrown "+url);			
		    return url;
		}
	}
	

}
