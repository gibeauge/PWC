package ca.pwc.windchill;

import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.arbortext.e3.E3Application; // pecommon.jar
import com.arbortext.e3.E3ApplicationConfig; // pecommon.jar
import com.arbortext.e3.E3ApplicationRequest; // pecommon.jar
import com.arbortext.e3.E3ApplicationResponse; // pecommon.jar
import com.arbortext.e3.StringArray; // pecommon.jar
import com.arbortext.epic.Acl; // aom.jar
import com.arbortext.epic.AclException; // aom.jar
import com.arbortext.epic.Application; // aom.jar
import com.arbortext.epic.cms.CMSAdapter; // aom.jar
import com.arbortext.epic.cms.CMSException; // aom.jar
import com.arbortext.epic.cms.CMSSession; // aom.jar

public class Compose implements E3Application {

    // Consts
    
    private static final String HOSTURL_PARAM = "hosturl";
    private static final String WORKSPACE_PARAM = "workspace";
    private static final String USERNAME_PARAM = "username";
    private static final String PASSWORD_PARAM = "password";
    private static final String EXECUTEAS_PARAM = "executeas";
    private static final String PROXYHOST_PARAM = "proxyhost";
    private static final String PROXYPORT_PARAM = "proxyport";
    private static final String INPUTFILE_PARAM = "file";
    private static final String INPUTTYPE_PARAM = "file-type";
    private static final String OUTPUTTYPE_PARAM = "type";
    private static final String RULE_PARAM = "rule";
    private static final String RULEFILE_PARAM = "rule-file";
    private static final String ZIPOUTPUT_PARAM = "zip-output";
    private static final String XMLHEADER_PARAM = "xml-header";
    private static final String FLATTENENTITIES_PARAM = "flatten-entities";
    
    private static final String[] REQUIRED_PARAMETERS = { "hosturl", "workspace", "username", "password", "file" };

    private static HashMap<String, String> g_parameterMap = null;

    // E3Application Interface
    
    @Override
    public void init(E3ApplicationConfig arg0) throws Exception {

    }


    @Override
    public void destroy() {

    }


    @Override
    public void doPost(E3ApplicationRequest paramE3ApplicationRequest, E3ApplicationResponse paramE3ApplicationResponse)
            throws Exception {

        this.doGet(paramE3ApplicationRequest, paramE3ApplicationResponse);
    }


    @Override
    public void doGet(E3ApplicationRequest paramE3ApplicationRequest, E3ApplicationResponse paramE3ApplicationResponse)
            throws Exception {
        
        try {            
            validateParameters(paramE3ApplicationRequest);

            CMSSession localCMSSession = establishWindchillSession(paramE3ApplicationRequest);
            preLoadObjects(paramE3ApplicationRequest);
            
            try {
                doConvert(paramE3ApplicationRequest, paramE3ApplicationResponse);
            } finally {
                try {
                    localCMSSession.invokeExtension(1, null);
                } catch (CMSException ex) { }

                if (localCMSSession != null) {
                    try {
                        localCMSSession.disconnect();
                    } catch (CMSException ex) { }

                }
            }
        } catch (Throwable localThrowable) {
            StringBuffer localStringBuffer = new StringBuffer();
            localStringBuffer.append("Compose Error\n\n");
            localStringBuffer.append(localThrowable.getMessage());

            localStringBuffer.append("\n\n---------------------------------------------------------");
            localStringBuffer.append("\n\nThe following parameters were received with this request:\n\n");

            @SuppressWarnings("rawtypes")
            Enumeration localEnumeration = paramE3ApplicationRequest.getParameterNames();
            while (localEnumeration.hasMoreElements()) {
                String param = localEnumeration.nextElement().toString();
                String value = paramE3ApplicationRequest.getParameter(param);
                if (value != null) {
                    if (param.equals("password")) {
                        value = "************";
                    }

                    localStringBuffer.append(param);
                    localStringBuffer.append("=");
                    localStringBuffer.append(value);
                    localStringBuffer.append("\n");
                }
            }

            paramE3ApplicationResponse.setContentType("text/plain");
            paramE3ApplicationResponse.setOutputPage(localStringBuffer.toString());
            paramE3ApplicationResponse.setStatus(500);
        }
    }


    // Methods


    @SuppressWarnings("rawtypes")
    private void doConvert(E3ApplicationRequest paramE3ApplicationRequest,
            E3ApplicationResponse paramE3ApplicationResponse) throws Exception {
        
        // Copy the list of parameters in a HashMap
        g_parameterMap = new HashMap<String, String>();
        Enumeration localEnumeration = paramE3ApplicationRequest.getParameterNames();
        while (localEnumeration.hasMoreElements()) {
            String param = localEnumeration.nextElement().toString();
            String value = paramE3ApplicationRequest.getParameter(param);
            if (value != null && value.length() > 0) {
                g_parameterMap.put(param, value);
            }
        }

        // If the 'file-type' parameter is not set, use the default value 'xml'.
        String fileType = paramE3ApplicationRequest.getParameter(INPUTTYPE_PARAM);
        if (null == fileType || fileType.length() == 0) {
            g_parameterMap.put("file-type", "xml");
        }

        // Gets the 'type' parameter value.
        String type = paramE3ApplicationRequest.getParameter(OUTPUTTYPE_PARAM);
        // Gets the 'rule' parameter value.
        String rule = paramE3ApplicationRequest.getParameter(RULE_PARAM);
        // Check if a 'rule' parameter was defined.
        boolean isRule = (rule != null) && (rule.length() > 0);

        // If no rule was specified and the type is 'xml' or 'sgml'
        if (!isRule && (type.equals("xml") || type.equals("sgml"))) {
            // Sets the default value 'yes' for the 'xml-header' parameter if no value was provided.
            String xmlHeader = paramE3ApplicationRequest.getParameter(XMLHEADER_PARAM);
            if (null == xmlHeader || xmlHeader.length() == 0) {
                g_parameterMap.put("xml-header", "yes");
            }
            // Sets the default value 'yes' for the 'flatten-entities' parameter if no value was provided.
            String flattenEntities = paramE3ApplicationRequest.getParameter(FLATTENENTITIES_PARAM);
            if (null == flattenEntities || flattenEntities.length() == 0) {
                g_parameterMap.put("flatten-entities", "yes");
            }

        }

        // If a rule is provided, the output type of the rule will be used.
        if (isRule) {
            g_parameterMap.remove("type");
        }

        File file = null;
        try {
            // Temp output file of the publication
            file = File.createTempFile("wvs_pe", ".tmp");
        } catch (IOException localIOException) {
            String msg = stringFormat("Error creating temporary file: {0}", new String[] { localIOException.getMessage() });

            throw new Exception(msg);
        }

        // Delete the output file if it already exist
        file.delete();

        String filePath = file.getAbsolutePath();        
        g_parameterMap.put("output-file", filePath);

        int i = 1;

        String convertResult = null;
        String result = null;
        try {
            convertResult = Acl.func("pwc_ape_wc::convert", "ca.pwc.windchill.Compose");

            StringArray arr = new StringArray(convertResult, ':', '*');

            result = arr.getValue("result");
            String reason = arr.getValue("reason");

            int statusCode = 200;
            if (reason != null) {
                try {
                    statusCode = Integer.parseInt(reason);
                } catch (Exception localException) {
                    String msg = stringFormat("Internal error: ''resultReason'' is non-numeric: {0}", new String[] { reason });

                    throw new Exception(msg);
                }

            }

            if (null == result) {
                throw new Exception("Internal error: null result");
            }
            
            if (result.equals("ok")) {
                String zipOutput = paramE3ApplicationRequest.getParameter("zip-output");
                String mimeType = getOutputMimeType(type, zipOutput, isRule);
                
                paramE3ApplicationResponse.setContentType(mimeType);
                paramE3ApplicationResponse.setOutputFile(file, true);
                paramE3ApplicationResponse.setStatus(200);

                i = 0;
            } else if (result.equals("file")) {
                paramE3ApplicationResponse.setContentType("text/html");
                paramE3ApplicationResponse.setOutputFile(file, true);
                paramE3ApplicationResponse.setStatus(statusCode);
                
                i = 0;
            } else {
                if (result.equals("string") || result.equals("error")) {
                    String body = arr.getValue("body");
                    if (null == body) {
                        body = arr.getValue("page");
                        if (null == body) {
                            body = "Unexpected error: null 'body' or 'page'";
                        }

                    }

                    StringBuffer buffer = new StringBuffer(body);
                    unHtmlize(buffer);

                    throw new Exception((buffer).toString());
                }

                throw new Exception("Unsupported result code: " + statusCode);
            }

        } catch (AclException ex) {
            String msg = stringFormat("Error calling ACL function ''pwc_ape_wc::convert'': {0}", new String[] { ex.getMessage() });
            throw new Exception(msg);
        } finally {
            if (i != 0) {
                // Delete the temporary output file
                file.delete();
            }
        }
    }
    
    
    private CMSSession establishWindchillSession(E3ApplicationRequest paramE3ApplicationRequest) throws Exception {

        // Get active session.
        CMSSession localCMSSession = Application.getActiveSession();
        
        // If a session is already active, we close it.
        if (localCMSSession != null) {
            try {
                localCMSSession.disconnect();
            } catch (CMSException ex) {
                // Do nothing
            }
        }

        // Windchill host url.
        String hosturl = paramE3ApplicationRequest.getParameter(HOSTURL_PARAM);
        // Windchill workspace.
        String workspace = paramE3ApplicationRequest.getParameter(WORKSPACE_PARAM);
        // windchill username.
        String username = paramE3ApplicationRequest.getParameter(USERNAME_PARAM);
        // Windchill username's password.
        String password = paramE3ApplicationRequest.getParameter(PASSWORD_PARAM);

        // Set the local adapter use to connect to Windchill
        CMSAdapter localCMSAdapter = Application.getAdapter("com.ptc.prowt.arbortext");
        // If the connector is not installed, throw an error.
        if (null == localCMSAdapter) {
            String msg = "The ''Adapter for Windchill'' is not installed or not enabled.  Please check the settings in installprefs.acl to ensure this feature is set to ''on''.";
            throw new Exception(msg);
        }

        CMSSession session = null;
        try {
            // If proxy host informations were provided, we set the adapter.
            String proxyHost = paramE3ApplicationRequest.getParameter(PROXYHOST_PARAM);
            if (proxyHost != null && proxyHost.length() > 0) {
                localCMSAdapter.setUserData("proxyHost", proxyHost);
            }

            // If proxy port informations were provided, we set the adapter.
            String proxyPort = paramE3ApplicationRequest.getParameter(PROXYPORT_PARAM);
            if (proxyPort != null && proxyPort.length() > 0) {
                localCMSAdapter.setUserData("proxyPort", proxyPort);
            }

            // If 'executeas' host informations were provided, we set the adapter.
            String executeAs = paramE3ApplicationRequest.getParameter(EXECUTEAS_PARAM);
            if (executeAs != null && executeAs.length() > 0) {
                localCMSAdapter.setUserData("impersonate", executeAs);
            }

            // We set the workspace information of the adapter.
            localCMSAdapter.setUserData("workspace", workspace);
            session = localCMSAdapter.connect(username, password, hosturl);
        } catch (CMSException ex) {
            String msg = stringFormat(
                    "There was an error establishing a session with the given parameters:\n\n\thosturl = ''{0}''\n\tworkspace = ''{1}''\n\tusername = ''{2}''\n\n{3}",
                    new String[] { hosturl, workspace, username, ex.getMessage() });

            if (ex.detail != null && ex.detail.length() > 0) {
                msg += "\n\n" + ex.detail;
            }
            throw new Exception(msg);
        }

        // A session couldn't be openned.
        if (null == session) {
            String msg = "Internal error: null CMSSession";
            throw new Exception(msg);
        }

        return session;
    }


    private void validateParameters(E3ApplicationRequest paramE3ApplicationRequest) throws Exception {

        StringBuffer localStringBuffer = null;
        for (int i = 0; i < REQUIRED_PARAMETERS.length; i++) {
            String rp = REQUIRED_PARAMETERS[i];
            String p = paramE3ApplicationRequest.getParameter(rp);

            if ((null == p) || (p.length() == 0)) {
                if (null == localStringBuffer) {
                    localStringBuffer = new StringBuffer();
                } else {
                    localStringBuffer.append(", ");
                }

                localStringBuffer.append(rp);
            }
        }

        if (localStringBuffer != null) {
            String msg = stringFormat("The request is missing the following required parameter(s): {0}",
                    new String[] { localStringBuffer.toString() });

            throw new Exception(msg);
        }

        String type = paramE3ApplicationRequest.getParameter(OUTPUTTYPE_PARAM);
        String rule = paramE3ApplicationRequest.getParameter(RULE_PARAM);
        String ruleF = paramE3ApplicationRequest.getParameter(RULEFILE_PARAM);

        int j = ((type != null) && (type.length() > 0) ? 4 : 0) + 
                ((rule != null) && (rule.length() > 0) ? 2 : 0) + 
                ((ruleF != null) && (ruleF.length() > 0) ? 1 : 0);

        String msg = null;

        switch (j) {
            case 3:
            case 4:
                break;
            case 0:
                msg = stringFormat("The request must specify either a ''{0}'' or both ''{1}'' and ''{2}'' parameters.", new String[] {
                        OUTPUTTYPE_PARAM, RULE_PARAM, RULEFILE_PARAM });
    
                throw new Exception(msg);
            case 1:
            case 2:
                msg = stringFormat("The request must specify both ''{0}'' and ''{1}'' parameters.", new String[] { RULE_PARAM,
                        RULEFILE_PARAM });
    
                throw new Exception(msg);
        }

        String zipOutput = paramE3ApplicationRequest.getParameter(ZIPOUTPUT_PARAM);

        if ((type != null) && (type.length() != 0) && (!outputTypeIsSelfContained(type))) {
            if ((null == zipOutput) || (!zipOutput.equals("yes"))) {
                msg = stringFormat("The requested output type, ''{0}'', is either unsupported or requires a zipped response because the response may contain externally referenced files such as graphics.  If the output type is supported, please specify a ''{1}'' parameter with a value of ''yes'' to request a zipped response.",
                        new String[] { type, ZIPOUTPUT_PARAM });

                throw new Exception(msg);
            }
        }
    }


    private void preLoadObjects(E3ApplicationRequest paramE3ApplicationRequest) {

        try {
            String file = paramE3ApplicationRequest.getParameter(INPUTFILE_PARAM);
            if (null == file || file.length() == 0) {
                return;
            }

            Random localRandom = new Random();
            int i = localRandom.nextInt();
            if (i < 0) {
                i *= -1;
            }
            String gVarName = "wvstemp" + i;

            Acl.execute("global " + gVarName + "[];");
            Acl.execute("$" + gVarName + "[1] = '" + file + "';");

            Acl.eval("hook_call('loadobjectshook'," + gVarName + ",1);");
            Acl.execute("unsetvar " + gVarName);
        } catch (Exception localException) {
        }
    }


    public static Map<String, String> getParameterMap() {

        if (null == g_parameterMap) {
            g_parameterMap = new HashMap<String, String>();
        }

        return g_parameterMap;
    }


    private static String stringFormat(String paramString, Object[] paramArrayOfObject) {
        return MessageFormat.format(paramString, paramArrayOfObject);
    }


    private boolean outputTypeIsSelfContained(String paramString) {

        return  paramString.equals("pdf")           || 
                paramString.equals("postscript")    || 
                paramString.equals("htmlhelp")      || 
                paramString.equals("web")           ||
                paramString.equals("dmp");
    }


    private String getOutputMimeType(String type, String zipOutput, boolean paramBoolean) {

        String mimeType = "application/octet-stream";

        if (paramBoolean || (zipOutput != null && zipOutput.equals("yes")) || type.equals("web") || type.equals("dmp")) {
            mimeType = "application/zip";
        } else if (type.equals("pdf")) {
                mimeType = "application/pdf";
        }else if (type.equals("postscript")) {
                mimeType = "application/postscript";
        } else if (type.equals("htmlhelp")) {
                mimeType = "application/octet-stream";
        }

        return mimeType;
    }


    private void replaceAll(StringBuffer paramStringBuffer, String arg0, String arg1) {

        int i;
        while ((i = paramStringBuffer.indexOf(arg0)) != -1)
            paramStringBuffer.replace(i, i + arg0.length(), arg1);
    }


    private void unHtmlize(StringBuffer paramStringBuffer) {

        replaceAll(paramStringBuffer, "<br style=\"none\"/>", "\n");
        replaceAll(paramStringBuffer, "<br>", "\n");
        replaceAll(paramStringBuffer, "<br/>", "\n");
        replaceAll(paramStringBuffer, "<p>", "\n");
        replaceAll(paramStringBuffer, "</p>", "\n");
        replaceAll(paramStringBuffer, "<pre>", "\n");
        replaceAll(paramStringBuffer, "</pre>", "\n");
        replaceAll(paramStringBuffer, "<b>", "");
        replaceAll(paramStringBuffer, "</b>", "");
    }

}
