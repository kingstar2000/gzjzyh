
function CreateControl(strId){
	var strObj = "";
	if (strId == "xselect")	{
		strObj = "<object style='width:100%' id='htcSelect' CLASSID='CLSID:E76DC08A-C7E3-4669-ABCA-30E9702EA4A9' " +
					"CODEBASE='CTAIS_HTC.cab#version=1,0,0,879' >" +
				"<param name='_ExtentX' value='3413'>" +
				"<param name='_ExtentY' value='556'>" +
				"<SPAN STYLE='color:red'>" +
					"ActiveX ����ʧ��! -- ������������İ�ȫ����ѡ��." +
				"</SPAN>" +
			"</object>";

	} else if (strId == "xdatawindow") {
		strObj = "<OBJECT ID='htcDatawindow' CLASSID='CLSID:DDF1E952-F686-42E6-A3AA-8CFDD3D8AE00' " + 
					"CODEBASE='CTAIS_HTC.CAB#version=1,0,0,110' style='width:100%;height:100%'>" +
				"<param name='_ExtentX' value='10795'>  " +
				"<param name='_ExtentY' value='7250'> " +
				"<SPAN STYLE='color:red'> " +
					"ActiveX ����ʧ��! -- ������������İ�ȫ����ѡ��." +
				"</SPAN> " + 
			"</OBJECT>";
	} else if (strId == "xtree") {
		strObj = "<OBJECT style='width=100%;height:100%' ID='htcTree' CLASSID='CLSID:03353F36-C17F-4A94-A609-3DA452B80D40' " +
					"CODEBASE='../lib/ctais_htc.cab#version=1,0,0,125'> " +
				"<param name='_ExtentX' value='5530'> " +
				"<param name='_ExtentY' value='5265'> " +
				"<div style='color:red'>" +
					"CTAIS���xtree����ʧ�ܣ�����<a href='/ctais/work/public/htm/install.htm#download' target='_blank'>��װ</a>�����������İ�ȫ����ѡ��" +
				"</div> " +
			"</OBJECT>";
	} else if (strId == "xdrop") {
		strObj = "<object style='width:100%' id='htcDrop' CLASSID='CLSID:DD8322CC-5630-47FF-A6F8-56FFC2BA5E17' " +
					"CODEBASE='../lib/ctais_htc.cab#version=1,0,0,125'> " +
				"<param name='_ExtentX' value='100'> " +
				"<param name='_ExtentY' value='556'> " +
				"<div style='color:red'> " +
					"CTAIS���xdrop����ʧ�ܣ�����<a href='/ctais/work/public/htm/install.htm#download' target='_blank'>��װ</a>�����������İ�ȫ����ѡ��" +
				"</div> " + 
				"</object>";
	} else if (strId == "xlist") {
		strObj = "<object style='width:100%;height:100%' id='htcList' CLASSID='CLSID:8DD15C76-6FCC-411E-BBC2-92306D9AFA33' " +
					"CODEBASE='../lib/ctais_htc.cab#version=1,0,0,125'> " +
				"<param name='_ExtentX' value='6482'> " +
				"<param name='_ExtentY' value='5027'> " +
				"<div style='color:red'>" + 
					"CTAIS���xlist����ʧ�ܣ�����<a href='/ctais/work/public/htm/install.htm#download' target='_blank'>��װ</a>�����������İ�ȫ����ѡ��" +
				"</div>" +
				"</object>";

	} else {
		strObj = "<SPAN STYLE='color:red'>" +
				"ָ����htc���������!" +
			"</SPAN>";
	}
	
	document.write(strObj);
	document.close();
}