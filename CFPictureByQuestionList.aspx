<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="CFPictureByQuestionList.aspx.cs" Inherits="CFPictureByQuestionList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
 
 
  </style>  
  
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
   <script src="js/bootstrap.min.js" type="text/javascript"></script>
   <script src="js/jquery-ui.js" type="text/javascript"></script>
   <link rel="stylesheet" href="css/bootstrap.css"> 
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" type="text/css" /> 
     <link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
 
  
<script type="text/javascript"  language="javascript">
function Load()
	{
	   // alert("test");
	}
function DoSubmitBack()
	{
	     DisableButtons()
	     
	      Max_Visit_Per_Store_Mx=document.aspnetForm.Max_Visit_Per_Store_Mx.value;
	      //alert("Max_Visit_Per_Store_Mx=" + Max_Visit_Per_Store_Mx);
	        
	     Photo_q_complete=document.aspnetForm.Photo_q_complete.value
	      // alert("Photo_q_complete=" + Photo_q_complete);
	     NewScreenPage=document.aspnetForm.NewScreenPage.value
         StrNewCallFormPathLink=document.aspnetForm.StrNewCallFormPathLink.value
	      
	     if (Photo_q_complete=="N")
	     {
	            var ok=confirm('<%=vPrompts[10]%>' + " \n " + '<%=vPrompts[11]%>' + " \n " + '<%=vPrompts[12]%>') 
				if (ok)
					{
						     if (Max_Visit_Per_Store_Mx>1)
	                            {
	                                    // if (NewScreenPage=="Y")
                                          //   {
                                          //       document.aspnetForm.action=StrNewCallFormPathLink   
                                          //   }
                                        // else
                                          //   {
	                                           document.aspnetForm.action = "CFJWT_Input_Photo_Option.aspx";
	                                       // }
	                                    document.aspnetForm.submit();
	                                    return false;
	                            }
	                            else
	                            {
	                                    // if (NewScreenPage=="Y")
                                        //     {
                                        //         document.aspnetForm.action=StrNewCallFormPathLink   
                                        //     }
                                        // else
                                           //  {
    	                                        document.aspnetForm.action = "CFJWTInputs.aspx";
    	                                   //  }
	                                    document.aspnetForm.submit();
	                                    return false;
	                            }	
					}
				else
					{
						//alert("Please continue with the Internet Call Form.")
						//alert('<%=vPrompts[7]%>')
						 
						AbleButtons()
						return false
					}	
	    }
	    else
	    {
	       
	        if (Max_Visit_Per_Store_Mx>1)
	        {
	                 if (NewScreenPage=="Y")
                         {
                             document.aspnetForm.action=StrNewCallFormPathLink   
                         }
                     else
                         {
	                        document.aspnetForm.action = "CFJWT_Input_Photo_Option.aspx";
	                     }
	                document.aspnetForm.submit();
	                return false;
	        }
	        else
	        {
	                 if (NewScreenPage=="Y")
                         {
                             document.aspnetForm.action=StrNewCallFormPathLink   
                         }
                     else
                         {
    	                     document.aspnetForm.action = "CFJWTInputs.aspx";
    	                 }
	                document.aspnetForm.submit();
	                return false;
	        }
        }		 
	}
	
function QuestionByPhoto_Access(Pq_no,P_res_val,P_upc,upc_desc,q_desc,Res_desc)
	{ 
//        alert("P_upc=" + P_upc);
//        alert("Pq_no=" + Pq_no);
//        alert("P_res_val=" + P_res_val)
	   //alert("CF_visit_dt=" + P_visit_dt);
 	   document.aspnetForm.Photo_Q_No.value=Pq_no;
 	   document.aspnetForm.Photo_q_Res_Val.value=P_res_val;
 	   document.aspnetForm.Photo_Prod_upc.value=P_upc; 
 	   
 	   document.aspnetForm.Photo_upc_desc.value=upc_desc;
 	   document.aspnetForm.Photo_q_desc.value=q_desc;
 	   document.aspnetForm.Photo_Res_desc.value=Res_desc; 
 	   
 	   //Check for apple chrome 
 	   
 	   AppleIpadUsedFlag=document.aspnetForm.AppleIpadUsed.value;
 	   //AppleIpadUsedFlag="Y";
 	  // alert("AppleIpadUsedFlag=" + AppleIpadUsedFlag);
 	   if (AppleIpadUsedFlag=="Y")
 	   {
 	        document.aspnetForm.action  = "CFPictureGetSingleFile.aspx";
 	   }
 	   else
 	   {
             document.aspnetForm.action  = "CFPictureMultiFile.aspx";
           // document.aspnetForm.action  = "CFPictureGetSingleFile.aspx";
       }
        document.aspnetForm.submit();
		return false;
 }
 function PhotoWithoutQuestion()
	{ 
        document.aspnetForm.Photo_Q_No.value='';
 	    document.aspnetForm.Photo_q_Res_Val.value='';
 	    document.aspnetForm.Photo_Prod_upc.value=''; 
 	   
 	    document.aspnetForm.Photo_upc_desc.value='';
 	    document.aspnetForm.Photo_q_desc.value='';
 	    document.aspnetForm.Photo_Res_desc.value='';     
        document.aspnetForm.action  = "CFPictureMultiFile.aspx";
        document.aspnetForm.submit();
		return false;
 }
function DisableButtons()
	{
	      //******* Disabled the buttons
	      // document.aspnetForm.ctl00$ContentPlaceHolder1$NextBtn.disabled=true;
		    //document.aspnetForm.ctl00$ContentPlaceHolder1$NextBtn.disabled=true;
		    var ExistNext=document.getElementById("ctl00_ContentPlaceHolder1_NextBtn");
            if (ExistNext!=null)
            {
               document.aspnetForm.ctl00_ContentPlaceHolder1_NextBtn.disabled=true;
            }
             var ExistRts=document.getElementById("ctl00_ContentPlaceHolder1_RTSBtn");
            if (ExistRts!=null)
            {
               document.aspnetForm.ctl00_ContentPlaceHolder1_RTSBtn.disabled=true;
            }
		 
	}
function AbleButtons()
	{
	     //******* abled the buttons
	     //document.aspnetForm.ctl00$ContentPlaceHolder1$NextBtn.disabled=false;
         var ExistNext=document.getElementById("ctl00_ContentPlaceHolder1_NextBtn");
        if (ExistNext!=null)
        {
           document.aspnetForm.ctl00_ContentPlaceHolder1_NextBtn.disabled=false;
        }	 
         var ExistRts=document.getElementById("ctl00_ContentPlaceHolder1_RTSBtn");
        if (ExistRts!=null)
        {
           document.aspnetForm.ctl00_ContentPlaceHolder1_RTSBtn.disabled=false;
        }
	}
function GoToRTS()
	 {
	         DisableButtons()
	         Photo_q_complete=document.aspnetForm.Photo_q_complete.value
	        // alert("Photo_q_complete=" + Photo_q_complete);
	         if (Photo_q_complete=="N")
	         {
	        //var ok=confirm('<%=vPrompts[10]%>' + " \n " + '<%=vPrompts[11]%>' + " \n " + '<%=vPrompts[12]%>')
	                var ok=confirm('<%=vPrompts[10]%>' + " \n " + '<%=vPrompts[11]%>' + " \n " + '<%=vPrompts[12]%>') 
				    if (ok) {
				        RTS_Url = document.aspnetForm.RTS_Url.value
				        document.aspnetForm.action = RTS_Url;
						     //document.aspnetForm.action="http://mi23.sparinc.com/itsnet/its_main.aspx"
                             document.aspnetForm.submit()
                             return true;
					    }
				    else
					    {
						    //alert("Please continue with the Internet Call Form.")
						    //alert('<%=vPrompts[7]%>')
    						 
						    AbleButtons()
						    return false;
					    }	
	        }
	        else {
	            RTS_Url = document.aspnetForm.RTS_Url.value
	            document.aspnetForm.action = RTS_Url;
    	         //document.aspnetForm.action="http://mi23.sparinc.com/itsnet/its_main.aspx"
                 document.aspnetForm.submit()
                 return true;
            }		   
	 } 
 //***************** photo PopUp
function PhotoPopUp(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc)
{
         
      
        //alert("works");
           // alert("strQ_Res11=" + strQ_Res);
          //alert("Job_No=" + Job_No);
          //alert("Wave_No=" + Wave_No);
          //alert("Task_No=" + Task_No);
          //alert("Chain_No=" + Chain_No);
         // alert("Store_No=" + Store_No);
          //alert("Merch_no=" + Merch_no);
          //alert("Visit_Date=" + Visit_Date);
          //alert("Q_no=" + Q_no);
          // alert("Prod_upc=" + Prod_upc);
          
         // Lang_id="1"              
        //  Job_No="101449"                     
         // Wave_No="201521"                     
         // Task_No="1"                    
        //  Chain_No="2821"  
        //  Store_No="1"     
         // merch_no="95057"
         // Visit_Date="01/11/16" 
         // Q_no="001"
        //  Prod_upc=""
          // alert("works");
           winnerType="1"
           $('#myModal').on('hide.bs.modal', function () {
                el = document.getElementById('ProdQuestion');
                el.style.display = "none";
            })
           
       $.ajax({
                type: 'POST',
                url: 'WebService.asmx/JustTest',
                data: "{Lang_id: '" + Lang_id + "',Job_No: '" + Job_No + "',Wave_No: '" + Wave_No + "',Task_No: '" + Task_No + "',Chain_No: '" + Chain_No + "',Store_No: '" + Store_No + "',Merch_no: '" + Merch_no + "',Visit_Date: '" + Visit_Date + "',Q_no: '" + Q_no + "',strQ_Res: '" + strQ_Res + "',Prod_upc: '" + Prod_upc + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                  
                     $("#DisplayInfo").html("<h2><span id='message_txt' class='LabelBlack' style='color:Red;font-weight:bold;'><%=vPrompts[36]%></span></h2>"); 
                     $('#myModal').modal('show'); 

                },
                complete: function () {
                  
                    //setTimeout("$('#myModal').modal('hide');", 1000);

                },
                success: function (data) {
 
                var obj = JSON.parse(data);
                   // alert("Done1");
                  // alert(obj[0]["photo_file_path"]);
                   // var obj = JSON.stringify(data);
                   // alert("Done1");
                    //for (var key in obj)
                   // {
                    //      alert("loop=" + key.photo_file_path ) 
                        
                   // };
                   //  alert("good");
                  //alert("strQ_Res=" + strQ_Res);
                 // alert("Q_no=" + Q_no);
                  //alert("Prod_upc=" + Prod_upc);
          
                     StrAllHTMLtext=""; 
                     StrHTMLSaveBtntext="";
                     StrPhotoName=""; 
                     PhotoCnt=0;
                    setTimeout(
                          function () 
                            {
                               
                                // alert("ready");
                               StrAllHTMLtext=CreateTableHeaderHTML(Q_no,Prod_upc,strQ_Res)
                             // alert("StrAllHTMLtext=" + StrAllHTMLtext);
                                
                            $.each(obj, function (i, item) {
                                  //$("#winnerDiv").html("<h2>" + item + "</h2>");
                                   //alert("item=" + item.photo_file_path);
                                 // alert("i=" + i);
                                  p_id=item.p_id
                                  PhotoName=item.photo_file_path;
                                  Status=item.approval_flag;
                                  StrPhotoName=StrPhotoName + p_id + "|" 
                                 FunHTMLtext=CreateHTML(PhotoName,Status,i,Q_no,strQ_Res,Prod_upc)
                                StrAllHTMLtext=StrAllHTMLtext + FunHTMLtext 
                                PhotoCnt=PhotoCnt+1
                             })
                                //alert("PhotoCnt=" + PhotoCnt)
                                 document.getElementById('PopUpPhotoCnt').value=PhotoCnt;
                                StrHTMLSaveBtntext=CreateSaveButtonTxt(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc)
                                StrAllHTMLtext=StrAllHTMLtext + StrHTMLSaveBtntext
                                StrAllHTMLtext=StrAllHTMLtext + "</table>"
                              
                            //alert("StrAllHTMLtext=" + StrAllHTMLtext)
                           //  alert("StrPhotoName=" + StrPhotoName)
                             $("#DisplayInfo").html("" + StrAllHTMLtext +" "); 
                              $('#myModal').modal('show'); 
                             document.getElementById('PopUp_P_id').value=StrPhotoName;
                          },
                    1000);

                    
                  

                    return false;

                },
                error: function (msg) {
                     alert(msg.responseText);
                }  
                
            });
           
           
     

            return false;
            
      // PhotoName="http://spareyes.sparinc.com/SPAREyesPic/SPAREyesPic1/working/20160127/1014492015213329422595057_20161271407595610.jpg";
       //Status="A";
       // StrHTMLText = CreateHTML(PhotoName,Status)
       // HTMLText = HTMLText + "" + HTMLResponseText
        
        $('.closeModal').click(function(){
        //$($(this).closest('.modal')).modal('hide');
       // alert('look');
        })


        
       
                // el = document.getElementById('ProdQuestion');
              //   el.style.display = "none";

           // });
}

  function OnGetWinnerSuccess(data, status) {

            alert('success');
            return false;
        }

        function OnGetWinnerError(request, status, error) {

            alert(status);
            return false;
        }
        
 
 function CreateTableHeaderHTML(Q_no,Prod_upc,strQ_Res)
{
   
         HTML_Headtext="";
         CallFormType_no=document.getElementById('CallFormType_no').value 
         
         QHtxtName = "Q" + Q_no + "_" + Prod_upc + ""
         Q_headerText = eval("document.getElementById('" + QHtxtName + "').value")
         // alert("Q_headerText=" + Q_headerText)
         TPOS = Q_headerText.indexOf("_")
         AnsTyp = Q_headerText.substring(0, TPOS)
        // alert("AnsTyp=" + AnsTyp) 
         TPoslen = Q_headerText.length;

         Q_AnsText = Q_headerText.substring(TPOS + 1, TPoslen)
                             
         //alert('Q_AnsText=' + Q_AnsText);
         strvPrompts = "<%=vPrompts[26]%>";
         strvPrompt1 = "<%=vPrompts[28]%>";
         strvPrompt2 = "<%=vPrompts[30]%>";
         
         HTML_Headtext="<table cellspacing='0'  border='0' id='ctl00_ContentPlaceHolder1_PhotoQGrid' >"
         if (CallFormType_no==2)
         {
                   UPCtxtName = "P" + Prod_upc + ""
                   Q_UPCText = eval("document.getElementById('" + UPCtxtName + "').value")
        
                 HTML_Headtext=HTML_Headtext + "<tr>"
                 HTML_Headtext=HTML_Headtext + "<td class='reportCriteriaHeader' style='width:10%'>"
                 HTML_Headtext=HTML_Headtext + " <span id='q1' class='reportCriteriaHeader'>" + strvPrompt1 + "</span>"
                 HTML_Headtext=HTML_Headtext + "</td>" 
                 HTML_Headtext=HTML_Headtext + "<td colspan='2' class='selectionCriteriaItem' style='width:90%'>"
                 HTML_Headtext=HTML_Headtext + ": " + Q_UPCText + ""
                 HTML_Headtext=HTML_Headtext + "</td>" 
                 HTML_Headtext=HTML_Headtext + "</tr>"
         }
        
         HTML_Headtext=HTML_Headtext + "<tr>"
         HTML_Headtext=HTML_Headtext + "<td class='reportCriteriaHeader' style='width:10%'>"
         HTML_Headtext=HTML_Headtext + " <span id='q1' class='reportCriteriaHeader'>" + strvPrompts + "</span>"
         HTML_Headtext=HTML_Headtext + "</td>" 
         HTML_Headtext=HTML_Headtext + "<td colspan='2' class='selectionCriteriaItem' style='width:90%'>"
         HTML_Headtext=HTML_Headtext + ": " + Q_AnsText + ""
         HTML_Headtext=HTML_Headtext + "</td>" 
         HTML_Headtext=HTML_Headtext + "</tr>"
         //R001_1
         RHtxtName = "R" + Q_no + "_" + Prod_upc + ""
         // alert('RHtxtName=' + RHtxtName);
         R_headerText = eval("document.getElementById('" + RHtxtName + "').value")
          // alert('Complete=' + R_headerText);
            RArray = R_headerText.split("|");
            Rlength = RArray.length
         
            Rlength = eval(Rlength)
            Rlength = Rlength - 1;
            ResTxt="";
          
           for (p = 0; p < Rlength; p++) 
           {
                RArrayText = RArray[p].valueOf()
                // alert("RTArrayText=" + RTArrayText) 
              if ((AnsTyp=='C')||(AnsTyp=='R')||(AnsTyp=='R'))
                {
                        POS = RArrayText.indexOf("-")
                        Res_Val = RArrayText.substring(0, POS)
                        if (Res_Val==strQ_Res)
                        {
                            ResTxt=RArrayText  
                        }
                }
              else
               {
                     ResTxt=RArrayText  
               }  
                
            }
         
         HTML_Headtext=HTML_Headtext + "<tr>"
         HTML_Headtext=HTML_Headtext + "<td class='reportCriteriaHeader' style='width:10%'>"
         HTML_Headtext=HTML_Headtext + " <span id='q1' class='reportCriteriaHeader'>" + strvPrompt2 + "</span>"
         HTML_Headtext=HTML_Headtext + "</td>" 
         HTML_Headtext=HTML_Headtext + "<td colspan='2' class='selectionCriteriaItem' style='width:90%'>"
         HTML_Headtext=HTML_Headtext + ": " + ResTxt + ""
         HTML_Headtext=HTML_Headtext + "</td>" 
         HTML_Headtext=HTML_Headtext + "</tr>"
         
 
         //   alert("HTMLtext=" + HTMLtext);
            return HTML_Headtext;
}
 

function CreateSaveButtonTxt(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc)
{
      Strstyle2='style="display: none; position: absolute; left: 130px; top: 50px; border: solid black 1px; padding: 10px; background-color:White; text-align: justify; font-size: 12px; width: 350px;z-index: 1400;"';
            
    strvPromptSav = "<%=vPrompts[34]%>";
    strvPromptclose = "<%=vPrompts[35]%>";
    
    StrSaVal = "'" + Lang_id + "','" + Job_No + "','" + Wave_No + "','" + Task_No + "','" + Chain_No + "','" + Store_No + "','" + Merch_no + "','" + Visit_Date + "','" + Q_no + "','" + strQ_Res + "','" + Prod_upc + "'";
    Stronclick = 'onclick="SendDataToProduction(' + StrSaVal + ');return false"';
    StrOnClickClosemodal = 'onclick="Closemodal();return false"';
    
    
     HTMLSavBtntext=" <tr>"
    HTMLSavBtntext=HTMLSavBtntext + "<td colspan='3'>"
    HTMLSavBtntext=HTMLSavBtntext + "<div id='DisplaySendDataError'  " + Strstyle2 + " ></div><div id='DisplaySendDataErrorObj'></div>" 
    HTMLSavBtntext=HTMLSavBtntext + "</td>" 
    HTMLSavBtntext=HTMLSavBtntext + "</tr>"
    HTMLSavBtntext=HTMLSavBtntext + " <tr>"
    HTMLSavBtntext=HTMLSavBtntext + "<td colspan='3' width='100%'>"
    HTMLSavBtntext=HTMLSavBtntext + "<center>"
    HTMLSavBtntext=HTMLSavBtntext + "<input type='submit' name='PUcalbtn' value='" + strvPromptclose + "' id='PUcalbtn' class='Button' class='Button' " + StrOnClickClosemodal + " />&nbsp&nbsp"
    HTMLSavBtntext=HTMLSavBtntext + "<input type='submit' name='PUSavbtn' value='" + strvPromptSav + "' id='PUSavbtn' class='Button' class='Button' " + Stronclick + " />"
    HTMLSavBtntext=HTMLSavBtntext + "</center>"
    HTMLSavBtntext=HTMLSavBtntext + "</td>" 
    HTMLSavBtntext=HTMLSavBtntext + "</tr>"
    //alert("HTMLSavBtntext=" + HTMLSavBtntext);
    return HTMLSavBtntext;
}
function CreateDoneButtonTxt()
{

    //StrJavaVal = "'" + i + "','" + Pick_Q_no + "','" + Pick_Q_Res + "'";
  // Stronclick = 'onclick="Move_SaveSelAns(' + StrJavaVal + ');return false"';
   Stronclick = 'onclick="Move_SaveSelAns();return false"';
    HTMLSavBtntext="<tr>"
    HTMLSavBtntext=HTMLSavBtntext + "<td  width='10%'>"
    HTMLSavBtntext=HTMLSavBtntext + "</td>"
    HTMLSavBtntext=HTMLSavBtntext + "<td colspan='2' width='100%'>"
    HTMLSavBtntext=HTMLSavBtntext + "<input type='submit' name='MSavAnsbtn' value='Done' id='MSavAnsbtn' class='Button' class='Button' " + Stronclick + " />"
    HTMLSavBtntext=HTMLSavBtntext + "</td>" 
    HTMLSavBtntext=HTMLSavBtntext + "</tr>"
      return HTMLSavBtntext;
}
                       
function CreateHTML(PhotoName,Status,i,Pick_Q_no,Pick_Q_Res,Prod_upc)
{
        // alert('CreateHTML=' + Pick_Q_Res);
         //  alert('Pick_Q_no=' + Pick_Q_no);
           
           document.getElementById('DivPopUP_R_typeQ').value="";
           document.getElementById('DivPopUP_Ele_Name').value = "";
           document.getElementById('DivPopUP_Move_Q_Res').value="";
          
                          
             StrJavaVal = "'" + i + "','" + Pick_Q_no + "','" + Pick_Q_Res + "','" + Prod_upc + "'";
           //Stronclick = 'onclick="DivPhotoLinkedQ(' + StrJavaVal + ');return false"';
          // Stronclick = 'onclick="opendiv();return false"';
            Stronclick = 'onclick="opendiv(' + StrJavaVal + ');return false"';
            Strstyle='style="display: none; position: absolute; left: 130px; top: 50px; border: solid black 1px; padding: 10px; background-color:White; text-align: justify; font-size: 12px; width: 350px;z-index: 1400;"';
           //Strstyle="";
            HTMLtext="";
            Prod_id="";
          Prompt1 = '<%=vPrompts[27]%>';
           //Leave a space
            HTMLtext=HTMLtext + "<tr>" 
            HTMLtext=HTMLtext + "<td colspan='3' class='selectionCriteriaItem' style='height:25px;width:90%;'>"
            HTMLtext=HTMLtext + "</td>" 
            HTMLtext=HTMLtext + "</tr>"
            
            HTMLtext=HTMLtext + "<tr>"
            HTMLtext=HTMLtext + "<td  width='10%'>"
            HTMLtext=HTMLtext + "</td>"
            HTMLtext=HTMLtext + "<td  colspan='2' width='90%'>"
            HTMLtext=HTMLtext + "<img id='ShowPic' src='" + PhotoName + "' style='height:200px;width:200px;border-width:0px;' /> "
            HTMLtext=HTMLtext + "<INPUT type='checkbox' name='PhotoDelete" + Pick_Q_no + "0" + Prod_id + "' id='PhotoDelete" + Pick_Q_no + "0" + Prod_id + "' value=''  ></div><span class='selectionCriteriaItem'>" + Prompt1 + "</span>";
            HTMLtext=HTMLtext + "</td>"
            HTMLtext=HTMLtext + "</tr>"
            //Leave a space
            HTMLtext=HTMLtext + "<tr>" 
            HTMLtext=HTMLtext + "<td colspan='3' class='selectionCriteriaItem' style='height:25px;width:90%;'>"
            HTMLtext=HTMLtext + "</td>" 
            HTMLtext=HTMLtext + "</tr>"
            
            HTMLtext=HTMLtext + "<tr>"
            HTMLtext=HTMLtext + "<td  width='10%'>"
            HTMLtext=HTMLtext + "</td>"
            HTMLtext=HTMLtext + "<td  width='5%'>"
            HTMLtext=HTMLtext + "<input type='submit' name='AssignNewQ' value='Move' id='AssignNewQ' class='Button' class='Button' " + Stronclick + " style='display:none;' />"
            HTMLtext=HTMLtext + "<div id='GetQuestionInfo" + i + "'></div>"
            HTMLtext=HTMLtext + "<div id='QSelected" + i + "'  " + Strstyle + " ></div>"
            HTMLtext=HTMLtext + "</td>" 
             HTMLtext=HTMLtext + "<td style='width:85%;'><div id='QSelectedMove" + i + "'>  </div><input id='SaveEachPhotoData" + i + "' type='hidden' value='0'/>"
            HTMLtext=HTMLtext + "</td>" 
           
            HTMLtext=HTMLtext + "</tr>"
            
          // alert("HTMLtext=" + HTMLtext);
            return HTMLtext;
}
//Create question div
function opendiv(ArrCnt,P_Q_no,Pick_Q_Res,Prod_upc)
{
                //StrAllHTMLtext="<h2><span id='message_txt' class='LabelBlack' style='color:Red;font-weight:bold;'>test</span></h2>"; 

               // ProdQuestion.innerHTML ="<h2><span id='message_txt' class='LabelBlack' style='color:Red;font-weight:bold;'>test</span></h2>"; 
                // $("#DisplayInfo").html("<h2>" + StrAllHTMLtext +"</h2>"); 
                   
                //$("#GetQuestionInfo0").html("<h2>" + StrAllHTMLtext +"</h2>"); 
                
               // el = document.getElementById('ProdQuestion');
               //check if the popup div is open or not
               document.getElementById('DivPopUP_R_typeQ').value="";
                 OldQ_PopUp_val =document.aspnetForm.OldQ_PopUp_val.value;
                alert('OldQ_PopUp_val=' + OldQ_PopUp_val);
                 if (OldQ_PopUp_val!="")
                {
                      ClosePopup(OldQ_PopUp_val)
                }
                document.aspnetForm.OldQ_PopUp_val.value=ArrCnt;
               
               
                 HTMLQuestionText = createQuestionHTML(ArrCnt,P_Q_no,Pick_Q_Res,Prod_upc) 
                 //alert('HTMLQuestionText=' + HTMLQuestionText);
                 StrHTMLSaveBtntext=CreateDoneButtonTxt()
                 StrAllHTMLtext=StrAllHTMLtext + StrHTMLSaveBtntext
                               
               Divqid="QSelected" + ArrCnt;
                el = eval("document.getElementById('" + Divqid + "')");
                //alert('Divqid=' + Divqid);
              
             // test=eval("'" + Divqid + "'.innerHTML='" + StrAllHTMLtext "'") 
                $('#QSelected'+ ArrCnt +'').html("" + HTMLQuestionText + "");  
                
                // $('#QSelected'+ ArrCnt +'').html("" + StrAllHTMLtext + "");  
            // var txt = eval("document.getElementById('GetQuestionInfo0')")
              Divtextid="GetQuestionInfo" + ArrCnt;
             //$('#GetQuestionInfo'+ ArrCnt +'').html("" + HTMLQuestionText + "");  	
                txt = eval("document.getElementById('" + Divtextid + "')");
                //alert('txt=' + txt);
             
             var p = GetScreenCordinates(txt);
             // alert("X:" + p.x + " Y:" + p.y);

            //var imgRight = this.offset().left + this.width();
           // var imgTop = this.offset().top + this.height();

             x = p.x-400;
             y = p.y-400;
             //y = y + 50
           //  y = y + 50
             el.style.left = x + "px";
             el.style.top = y + "px";
            // el.style.position="absolute";
             el.style.display = "block";
             
             
             // document.getElementById('ProdQuestion').focus();
               //  eval("document.getElementById('GetQuestionInfo').value='100'")
                 
                 // $("#GetQuestionInfo").html("<h2>good Job</h2>");   
            //document.getElementById('DivPopUP_R_typeQ').value="";
           // document.getElementById('DivPopUP_Ele_Name').value = "";

    //alert('Here2');
    return false;
}
function AssignPhotoNewQ(ArrCnt)
{   
        //this popup the second div
         // ProdQuestion.innerHTML ="<h2><span id='message_txt' class='LabelBlack' style='color:Red;font-weight:bold;'>test</span></h2>"; 
              //     $("#DisplayInfo").html("<h2>" + StrAllHTMLtext +"</h2>"); 
                //   $('#myModal').modal('show'); 
                //StrDivName="#GetQuestionInfo'" + ArrCnt + "'";
                QHTMLtext="";
                createQuestionHTML() 
                
               // alert("ArrCnt=" + ArrCnt);
                    $('#MoveQuestionDiv').modal('show');
                   // $('#GetQuestionInfo').html("<h2>good Job</h2>");  
                $('#GetQuestionInfo'+ ArrCnt +'').html("<h2>good Job</h2>");  
              
  
              // alert('Here2');
              return false;  
}
 function DivPhotoLinkedQ(ArrCnt,P_Q_no,Pick_Q_Res)
{   
               // alert('DivPhotoLinkedQ=' + P_Q_no);
               
             
                QHTMLtext="";
               HTMLQuestionText = createQuestionHTML(P_Q_no,Pick_Q_Res) 
                //alert('HTMLQuestionText=' + HTMLQuestionText);
                
                Divtextid="GetQuestionInfo" + ArrCnt;
               // alert('Divtextid=' + Divtextid);
               // eval("GetQuestionInfo'" + ArrCnt + "'.innerHTML='<h2>good Job</h2>'"); 
  				$('#GetQuestionInfo'+ ArrCnt +'').html("" + HTMLQuestionText + "");  	
                el = eval("document.getElementById('" + Divtextid + "')");
                el.style.display = "block";
              // alert('DivPhotoLinkedQ done');
              return false;  
}

 function createQuestionHTML(ArrCnt,P_Q_no,Pick_Q_Res,Prod_upc) 
{
    alert("createQuestionHTML=" + Prod_upc) 
    //*** Question Header Array
    document.getElementById('DivPopUP_Ele_Name').value="";
    document.getElementById('DivPopUP_Move_Q_Res').value="";
    HTMLTextQ = "";
    Answer_Type = "";
    ControlName = "";
    Prod_id="";
     
    Stronclose = 'onclick="return ClosePopup(' + ArrCnt + ');"';
    
    HTMLTextQ = HTMLTextQ + "<table bgcolor='#f5fffa' width='100%' cellpadding='0' cellspacing='0'>";
    HTMLTextQ = HTMLTextQ + "<tr >";
    HTMLTextQ = HTMLTextQ + "<td width='96%' height='10%'> &nbsp; </td>";
    HTMLTextQ = HTMLTextQ + "<td align='right'  width='100%' height='10%'><img src='Images/x.jpg' " + Stronclose + "></td>";
    HTMLTextQ = HTMLTextQ + "</tr>";
    HTMLTextQ = HTMLTextQ + "</table>";   
    HTMLTextQ = HTMLTextQ + "<table border='1' width='100%'  bordercolor='dodgerblue'>";
    RCA = 0
    //Loop throught the prod array
    AllProdListArray = eval("document.getElementById('AllProdList').value")
    APLArray = AllProdListArray.split("|");
    APLlength = APLArray.length
 
    APLlength = eval(APLlength)
    APLlength = APLlength - 1;

    for (b = 0; b < APLlength; b++) 
    {
               Ele_Prod_no = APLArray[b].valueOf()
              // alert("Ele_Prod_no=" + Ele_Prod_no) 
                     PdivName="P" + Ele_Prod_no
                   //QuestionArray = eval("document.getElementById('AllQuestionArray').value")
                   ProdUPCTxt = eval("document.getElementById('" + PdivName + "').value")
                  // alert("ProdUPCTxt=" + ProdUPCTxt) 
                   
                    HTMLTextQ = HTMLTextQ + "<tr  style='background-color:#1E90FF;'>"; 
                    HTMLTextQ = HTMLTextQ + "<td colspan='2' class='reportTableHeader'><B>" + ProdUPCTxt + "</B></td>";
                    HTMLTextQ = HTMLTextQ + "</tr>";   
                    
               // alert("step1") 
                    QdivName="ProdqList" + Ele_Prod_no
                   //QuestionArray = eval("document.getElementById('AllQuestionArray').value")
                   QuestionArray = eval("document.getElementById('" + QdivName + "').value")
                  // alert("QuestionArray=" + QuestionArray) 
                   
                    AQArray = QuestionArray.split("|");
                    AQlength = AQArray.length
                 
                    AQlength = eval(AQlength)
                    AQlength = AQlength - 1;
                
                    for (a = 0; a < AQlength; a++) 
                    {
                                    Question_no = AQArray[a].valueOf()
                                   //alert("Question_no=" + Question_no) 

                                    StrQ_no = Question_no
                                    
                                    QHName = "Q" + StrQ_no + "_" + Ele_Prod_no + "" 
                                    QuestionText = eval("document.getElementById('" + QHName + "').value")
                                   // alert("QuestionText=" + QuestionText)
                                    POS = QuestionText.indexOf("_")
                                    Ans_Type = QuestionText.substring(0, POS)
                                   // alert("Ans_Type=" + Ans_Type) 
                                    poslen = QuestionText.length;

                                    Q_Text = QuestionText.substring(POS + 1, poslen)

                                //   alert("Q_Text=" + Q_Text) 
             
                                    //DisplayQ_text = Question_no + " - " + Q_Text
                                    DisplayQ_text = Q_Text
                                    if (Ans_Type == "C") {
                                             Answer_Type = '<%=vPrompts[14]%>';
                                            ControlName = ControlName + "C" + StrQ_no + "0" + Prod_id + "|";
                                    }
                                    if (Ans_Type == "D") {
                                            Answer_Type = '<%=vPrompts[18]%>';
                                            DateRule = eval("document.getElementById('" + DateRule + "').value") 
                                            Answer_Type = Answer_Type.replace("mm/dd/yyyy", DateRule)

                                            ControlName = ControlName + "D" + StrQ_no + "0" + Prod_id + "|";
                                    }
                                    if (Ans_Type == "N") {
                                            Answer_Type = '<%=vPrompts[19]%>';
                                            ControlName = ControlName + "N" + StrQ_no + "0" + Prod_id + "|";
                                    }
                                    if (Ans_Type == "T") {
                                            Answer_Type = '<%=vPrompts[17]%>';
                                            ControlName = ControlName + "T" + StrQ_no + "0" + Prod_id + "|";
                                    }
                                    if (Ans_Type == "L" || Ans_Type == "R") {
                                            Answer_Type = '<%=vPrompts[15]%>';
                                            if (Ans_Type == "L") {
                                                ControlName = ControlName + "L" + StrQ_no + "0" + Prod_id + "|";
                                            }
                                            if (Ans_Type == "R") {
                                                ControlName = ControlName + "R" + StrQ_no + "0" + Prod_id + "|";
                                            }
                                    }
                                    if (Ans_Type == "P" || Ans_Type == "M" || Ans_Type == "H") 
                                    {
                                            Answer_Type = '<%=vPrompts[16]%>';
                                            if (Ans_Type == "P") {
                                                ControlName = ControlName + "P" + StrQ_no + "0" + Prod_id + "|";
                                                ControlName = ControlName + "P" + StrQ_no + "1" + Prod_id + "|";
                                            }
                                            if (Ans_Type == "M") {
                                                ControlName = ControlName + "M" + StrQ_no + "0" + Prod_id + "|";
                                                ControlName = ControlName + "M" + StrQ_no + "1" + Prod_id + "|";
                                            }
                                            if (Ans_Type == "H") {
                                                ControlName = ControlName + "H" + StrQ_no + "0" + Prod_id + "|";
                                                ControlName = ControlName + "H" + StrQ_no + "1" + Prod_id + "|";
                                            }
                                    }
                    Answer_Type="";
                    HTMLTextQ = HTMLTextQ + "<tr  style='background-color:LightYellow;'>";
                    HTMLTextQ = HTMLTextQ + "<td class='selectionCriteriaItem'>QNo.</td>";
                    HTMLTextQ = HTMLTextQ + "<td class='selectionCriteriaItem'><B>" + DisplayQ_text + "<span style='color:red;'> " + Answer_Type + " </span></B></td>";
                    HTMLTextQ = HTMLTextQ + "</tr>";
                  //}
                   // alert("before") 
                   //QuestionArray = eval("document.getElementById('" + AllQuestionArray + "').value")
                  // alert("HTMLTextQ=" + HTMLTextQ) 
                  
                    HTMLResponseText = GetQuestionResponse(Ans_Type, StrQ_no,P_Q_no,Pick_Q_Res,Ele_Prod_no)
                    HTMLTextQ = HTMLTextQ + "" + HTMLResponseText
                   // alert("HTMLTextQ=" + HTMLTextQ) 
                     //Each_Ele_name=document.getElementById('DivPopUP_Ele_Name').value 
                 }
        }
        //Stronclick = 'onclick="Movselect_QVal(' + StrJavaVal + ');return false"';
          StrItems = "'" + ArrCnt + "','" + P_Q_no + "','" + Pick_Q_Res + "'";
        Stronclick = 'onclick="Movselect_QVal(' + StrItems + ');return false"';
        StronclickReset = 'onclick="MovReset();return false"';
        HTMLTextQ = HTMLTextQ + "<tr  style='background-color:white;'>"; 
        HTMLTextQ = HTMLTextQ + "<td colspan='2' class='selectionCriteriaItem' >";
        HTMLTextQ = HTMLTextQ + "<center>"
        HTMLTextQ = HTMLTextQ + "<input type='submit' name='MDoneAnsbtn' value='Done' id='MDoneAnsbtn' class='Button' class='Button' " + Stronclick + " />"
        HTMLTextQ = HTMLTextQ + "<input type='submit' name='MovResetbtn' value='Reset' id='MovResetbtn' class='Button' class='Button' " + StronclickReset + " />"
        HTMLTextQ = HTMLTextQ + "</center>"
        HTMLTextQ = HTMLTextQ + "</td>"
        HTMLTextQ = HTMLTextQ + "</tr>" 

    HTMLTextQ = HTMLTextQ + "</Table>";
  //alert("HTMLTextQ=" + HTMLTextQ) 
    //Display the call form    
   // ProdQuestion.innerHTML = HTMLTextQ;
   return HTMLTextQ;
}

//**************************************** Get the responses for each question 
function GetQuestionResponse(Ans_Type, StrQ_no,P_Q_no,Pick_Q_Res,Ele_Prod_no) {
    //alert("responseIn")
        Prod_id="";
   // DateRule = eval("document.getElementById('DateRule').value")

       // PQR_Pos = Pick_Q_Res.indexOf("-")
      //  Sel_Ans_Val = Pick_Q_Res.substring(0, PQR_Pos)
      // alert("P_Q_no=" + P_Q_no)
      //alert("StrQ_no=" + StrQ_no)
       Sel_Ans_Val = Pick_Q_Res;
    RTname = "R" + StrQ_no + "_" + Ele_Prod_no + ""
    ResponseText = eval("document.getElementById('" + RTname + "').value")
    //alert("Sel_Ans_Val=" + Sel_Ans_Val) 

    RTArray = ResponseText.split("|");
    RTlength = RTArray.length
 
    RTlength = eval(RTlength)
    RTlength = RTlength - 1;
    POPUP_ArrayEle="";

    HTML_Ele = "";
    HTML_Ele = HTML_Ele + "<tr>";
    HTML_Ele = HTML_Ele + "<td class='selectionCriteriaItem'>Ans</td>";
    HTML_Ele = HTML_Ele + "<td>";
    HTML_Ele = HTML_Ele + "<Table border='0'>";


    for (q = 0; q < RTlength; q++) {
        RTArrayText = RTArray[q].valueOf()
        // alert("RTArrayText=" + RTArrayText) 

        //************** get answer values
        POS = RTArrayText.indexOf("-")
        Ans_Val = RTArrayText.substring(0, POS)
        //alert("Ans_Val=" + Ans_Val) 
        //************** get response text			 
        poslen = RTArrayText.length;
       
        Ans_Text = RTArrayText.substring(POS + 1, poslen)
       
        
        //function use
        ArrayEle_name="";
        Ele_id_name = "";
        Ele_name = "";
        Ele_name2="";
        StrItemM="";
        QStatus="";
        RTypeQ="";
        
        AddElName="Y"
       // alert("Ele_name=" + Ele_name) 
        if (StrQ_no==P_Q_no)
        {
            if ((Ans_Type == "C")||(Ans_Type == "R")|| (Ans_Type == "L")) 
                {
                    if (Sel_Ans_Val==Ans_Val)
                        {
                                        QStatus="Checked";
                                        document.getElementById('DivPopUP_Move_Q_no').value=StrQ_no;
                                         SaveResval=document.getElementById('DivPopUP_Move_Q_Res').value; 
                                        //alert("SaveResval=" + SaveResval) 
                                        if (SaveResval=="")
                                         {
                                            SaveResval="" + Sel_Ans_Val + ""
                                         }
                                       else
                                        {
                                            SaveResval="" + SaveResval + "|" + Sel_Ans_Val + ""
                                        }
                                        document.getElementById('DivPopUP_Move_Q_Res').value = SaveResval
                                                        
                            
                        }
                 }
             else
                {
                     QStatus="Checked";
                }
        }

        if (Ans_Type == "C") {
            Ele_id_name = "C" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "";
            Ele_name = "C" + StrQ_no + "0" + Prod_id + "";
            
            StrItems = "'C" + StrQ_no + "0" + Prod_id + "','" + StrQ_no + "'";
            
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
             
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            
            HTML_Ele = HTML_Ele + "<div id='rad_Span" + P_Q_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
            HTML_Ele = HTML_Ele + "<INPUT type='checkbox' name='C" + StrQ_no + "0" + Prod_id + "' id='C" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='" + Ans_Val + "' " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
        }
        //alert("q1")
        if (Ans_Type == "L") {
            Ele_id_name = "L" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            
            HTML_Ele = HTML_Ele + "<div id='rad_Span" + P_Q_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "'  id='L" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='" + Ans_Val + "'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
        //alert("q2")
        if (Ans_Type == "R") {
            Ele_id_name = "R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";

            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem' >";
            
            HTML_Ele = HTML_Ele + "<div id='rad_Span" + P_Q_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='" + Ans_Val + "'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
       // alert("q3")
        if (Ans_Type == "T") {
 
         
            Ele_id_name = "R" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
           HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='" + Ans_Val + "'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
       // alert("q4")
        if (Ans_Type == "N") {
            Ele_id_name = "N" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='0'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
       // alert("q5")
        if (Ans_Type == "D") {
            Ele_id_name = "D" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';

            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='0'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
      //  alert("q6")
        if (Ans_Type == "P") {
            Ele_id_name = "P" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";

            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
           HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='0'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
       // alert("q6")
        if (Ans_Type == "M") {
            Ele_id_name = "M" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
           
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='0'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }
        if (Ans_Type == "H") {
            Ele_id_name = "H" + StrQ_no + "0" + Prod_id + "";
            Ele_name = "R" + P_Q_no + "0" + Prod_id + "";
            StrItems = "'R" + P_Q_no + "0" + Prod_id + "','" + StrQ_no + "'";
            Stronclick = 'onclick="SkipPattern(' + StrItems + ')"';
            
            HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
            HTML_Ele = HTML_Ele + "<INPUT type='radio' name='R" + P_Q_no + "0" + Prod_id + "' id='R" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "' value='0'  " + Stronclick + " " + QStatus + "></div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
            HTML_Ele = HTML_Ele + "</td></tr>";
            RTypeQ="R";
        }

      //  alert("q")
        //*********** save the focus on the first element of the popupdiv
       // if (q == 0) {
       //     document.getElementById('DivPopUP_Ele_id').value = Ele_id_name
       // }
       // alert("Ele_name2=" + Ele_name) 
            //POPUP_ArrayEle=POPUP_ArrayEle + Ele_name
      
        
    }
    
     RQ_Status=document.getElementById('DivPopUP_R_typeQ').value;
     if ((RQ_Status=="Y")&&(RTypeQ=="R"))
     {
        AddElName="N";
     }
      
         
    if (AddElName=="Y")
    {
            ArrayEle_name=document.getElementById('DivPopUP_Ele_Name').value; 
             //   alert("ArrayEle_namewwww=" + ArrayEle_name)
            if (ArrayEle_name=="")
             {
                ArrayEle_name="" + Ele_name + ""
             }
           else
            {
                ArrayEle_name="" + ArrayEle_name + "|" + Ele_name + ""
            }
            document.getElementById('DivPopUP_Ele_Name').value = ArrayEle_name
             
      }
     
       
    if (RQ_Status=="")
     {
        if (RTypeQ=="R")
        {
            document.getElementById('DivPopUP_R_typeQ').value="Y";
        }
     }
    //ArrayEle_name=document.getElementById('DivPopUP_Ele_Name').value; 
  // alert("done=" + ArrayEle_name)
    //return false;
    HTML_Ele = HTML_Ele + "</Table>";
    HTML_Ele = HTML_Ele + "</td>";
    HTML_Ele = HTML_Ele + "</tr>";
   
    return HTML_Ele;
}

//***********************Done button on the popup
function Movselect_QVal(ArrCnt,P_Q_no,Pick_Q_Res)
{
//QSelectedMove
  //alert('Movselect_QVal');
            HTMLQMoveText="";
            SavAnsVal="";
            HTMLQMoveText = CreateMoveQuestionHTML(ArrCnt,P_Q_no,Pick_Q_Res) 
           // alert('ArrCnt=' + ArrCnt);
            $('#QSelectedMove'+ ArrCnt +'').html("" + HTMLQMoveText + "");  
            // alert("Movselect_QVal")
            //Selected values for each photo
            
            SelName = "Q" + P_Q_no
            SelQ_Text = eval("document.getElementById('" + SelName + "').value")

            SelPOS = SelQ_Text.indexOf("_")
            SelAns_Type = SelQ_Text.substring(0, POS)
           // alert("Ans_Type=" + Ans_Type) 
            
            //move the question to for each photo
            Mov_Q_no=document.getElementById('DivPopUP_Move_Q_no').value 
            MovName = "Q" + Mov_Q_no
            MovQ_Text = eval("document.getElementById('" + MovName + "').value")

            MovPOS = MovQ_Text.indexOf("_")
            MovAns_Type = MovQ_Text.substring(0, POS)
           // alert("Ans_Type=" + Ans_Type) 
                       
            Mov_Q_Res=document.getElementById('DivPopUP_Move_Q_Res').value 
            
            //SaveEachPhotoData
            SavAnsVal="" + SelAns_Type + "-" + P_Q_no + "-" + MovAns_Type + "-" + Mov_Q_no + "-" + Mov_Q_Res + "|"
            alert("SavAnsVal=" + SavAnsVal)
            DivnameSav="SaveEachPhotoData" + ArrCnt
            //alert("DivnameSav=" + DivnameSav)
            //eval("document.aspnetForm." + DivnameSav + ".value='" + SavAnsVal + "'")

            $('#SaveEachPhotoData'+ ArrCnt +'').val("" + SavAnsVal + "");  

            comback=$('#SaveEachPhotoData'+ ArrCnt +'').val() 
           // alert("comback=" + comback)
            
            ClosePopup(ArrCnt)
}
function MovReset()
{
alert("MovReset")
}
//****************** on click of the questions on the popup
function SkipPattern(EleName,SelQ)
{ 

 //alert("SelQ=" + SelQ)
 // alert("EleName=" + EleName)
  Selected_Ans_Type = EleName.substring(0,1)
  GetSaved_Ele_Name=document.getElementById('DivPopUP_Ele_Name').value
 // alert("GetSaved_Ele_Name=" + GetSaved_Ele_Name)
 
    FirstTime="YES"
    FinalAnswer="";
	Ele_NameListArray = GetSaved_Ele_Name.split("|");
	arraylength = Ele_NameListArray.length
	// alert("arraylength=" + arraylength) 
	//arraylength=eval(arraylength-1)
	 
		for ( i = 0 ; i < arraylength ; i++ )
			{
				StrEle_Name = Ele_NameListArray[i].valueOf()
				// alert("StrEle_Name=" + StrEle_Name)
				 Ans_Type = StrEle_Name.substring(0,1)
				// alert("Ans_Type=" + Ans_Type)
 	 
 	            if (Selected_Ans_Type=="R")
 	            {
				    if (Ans_Type=="C")
				    {
				             k1=eval("document.aspnetForm." + StrEle_Name + ".length")
		                    // alert("k2=" + k)	
				            // alert("Ans_Type=" + Ans_Type)
				     	        for (a=0; a<k1; a++)
							        {
							            eval("document.aspnetForm." + StrEle_Name + "[a].checked=false")
	                                    
						            }
				    }
				 }
				 if (Selected_Ans_Type=="C")
 	             {
				     if (Ans_Type=="R")
				     {
				             k2=eval("document.aspnetForm." + StrEle_Name + ".length")
		                    // alert("k2=" + k)	
				            // alert("Ans_Type=" + Ans_Type)
				     	        for (b=0; b<k2; b++)
							        {
							            eval("document.aspnetForm." + StrEle_Name + "[b].checked=false")
							            
						            }
				    }		
				}	
				
				   if (Ans_Type=="C")
				    {
				             k3=eval("document.aspnetForm." + StrEle_Name + ".length")
		                    // alert("k2=" + k)	
				            // alert("Ans_Type=" + Ans_Type)
				     	        for (c=0; c<k3; c++)
							        {
	                                         RadioValue=eval("document.aspnetForm." + StrEle_Name + "[c].checked")
									        //alert("checkValue=" + RadioValue)
									         if (RadioValue==true)
											    {
												    InPutValue=eval("document.aspnetForm." + StrEle_Name + "[c].value")
											    }
										    else
										        {
												    InPutValue=""
										        }
    										    
									    	    if ((InPutValue!=""))
											    {
    												 
																	    if (FirstTime=="YES")
																		    {
																			    FinalAnswer="" + InPutValue + ""
																			    FirstTime=""	
																		    }
																	    else
																		    {
																			    
																			    //ProdWithAnswerBack =document.getElementById('DivPopUP_Move_Q_Res').value
																			    FinalAnswer="" + FinalAnswer + "|" + InPutValue + ""
																		    }
											    }																		
															    					 
						            }//for loop
				    }
				    else
				    {
				                k4=eval("document.aspnetForm." + StrEle_Name + ".length")
		                       //alert("k4=" + k4)	
				     	        for (d=0; d<k4; d++)
							        {
							             
	                                     RadioValue=eval("document.aspnetForm." + StrEle_Name + "[d].checked")
									    //alert("RadioValue=" + RadioValue)
                                          if (RadioValue==true)
											    {
												    InPutValue=eval("document.aspnetForm." + StrEle_Name + "[d].value")
											    }
										    else
										        {
												    InPutValue=""
										        }
										        if ((InPutValue!=""))
											    {
													FinalAnswer="" + InPutValue + ""				 
											    }			
															 
						            }
				    }						
			}//end of for loop
			//alert("FinalAnswer=" + FinalAnswer)
			//alert("SelQ=" + SelQ)
		document.getElementById('DivPopUP_Move_Q_no').value=SelQ;
	    document.getElementById('DivPopUP_Move_Q_Res').value=FinalAnswer
 
}

function ClosePopup(ArrCnt) {
        //alert("close")
       // ArrCnt
     //$('#GetQuestionInfo0').modal('hide');
       Divname="QSelected" + ArrCnt;
       //alert("Divname=" + Divname)
        var IdExists= eval("document.getElementById('" + Divname + "')")
                            //		  //alert("IdExists=" + IdExists);
     if (IdExists!=null)
        {              
              el = eval("document.getElementById('" + Divname + "')");
              //el = document.getElementById('GetQuestionInfo0');
              el.style.display = "none";
              //$('#QSelected'+ ArrCnt +'').hide();  
               //parent.removeChild(el);
               el.innerHTML = '' 
        }
       
}
function Closemodal()
{
    $('#myModal').modal('hide');
}
//*******************************************send the data to the production
function SendDataToProduction(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc)
{

        
      // alert("Prod_upc=" + Prod_upc)
       // Prod_upc="0"
       CallFormType_no=document.getElementById('CallFormType_no').value
       if (CallFormType_no==1)
       {
            Prod_upc="0"
       }
        DeleteOrMove_Status="";
        StrSendToProdArray="";
       
        //*******Photocount
        PUPhotoCnt=document.getElementById('PopUpPhotoCnt').value
       // alert("PUPhotoCnt=" + PUPhotoCnt)
        //*******Photo P_id
        StrPhotoName=document.getElementById('PopUp_P_id').value 
        P_idArray = StrPhotoName.split("|");
        //*******popup delete checkbox
        StrChBoxName="PhotoDelete" + Q_no + "0"  
        
		
									     
         for (z=0; z<PUPhotoCnt; z++)
		 {
		        //alert("z=" + z)
		         DeleteOrMove_Status="";
		          //CheckBox
		             k=eval("document.aspnetForm." + StrChBoxName + ".length")
	                 //alert("k=" + k)	
	                LenCheck=String(k)
	               // alert("LenCheck=" + LenCheck)
	                if (LenCheck=="undefined")
			          {
                              PhChBoxStatus=eval("document.aspnetForm." + StrChBoxName + ".checked")
	                  }  
	                  else
	                  {     
		                      PhChBoxStatus=eval("document.aspnetForm." + StrChBoxName + "[z].checked")    
		              }
		             // alert("PhChBoxStatus=" + PhChBoxStatus)
				 // alert("z=" + z)
				  //Photo P_id
				  Photo_Pid = P_idArray[z].valueOf()
				  //alert("Photo_Pid=" + Photo_Pid)
				  //SaveAnswers
				  SavEachPhotoInfo=$('#SaveEachPhotoData'+ z +'').val() 
                 // alert("SavEachPhotoInfo=" + SavEachPhotoInfo)
                  if (PhChBoxStatus==true)
                  {
                        DeleteOrMove_Status="D";
                         
                        StrDeleteTxt="Delete-" + Photo_Pid + "-Z-" + Q_no + "-Z-000-0|";
                        StrSendToProdArray=StrSendToProdArray + StrDeleteTxt + "~"
                  }
                  else
                  {
                      if (SavEachPhotoInfo!=0)
                      {
                            DeleteOrMove_Status="M";
                            StrMoveTxt="Move-" + Photo_Pid + "-" + SavEachPhotoInfo + "";
                             StrSendToProdArray=StrSendToProdArray + StrMoveTxt + "~"
                      }
                  }
                
	     }			        
        //alert("StrSendToProdArray=" + StrSendToProdArray)
         if (StrSendToProdArray!="")
         {
         
               // alert("StrSendToProdArray=" + StrSendToProdArray)
         
             
              //$('#QSelected'+ ArrCnt +'').hide();  
               //parent.removeChild(el);
              // el.innerHTML = ''
       
              SubmitDataToProduction(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc,StrSendToProdArray)
                //  getData().done(function(results){
                // results are what retuned from the server
                // Seven();
                //});
         
         }   
         else
         {
                //alert("Please select one of the photo to delete.")
                alert('<%=vPrompts[33]%>')
         }   
     return false;         
}
 function SubmitDataToProduction(Lang_id,Job_No,Wave_No,Task_No,Chain_No,Store_No,Merch_no,Visit_Date,Q_no,strQ_Res,Prod_upc,StrSendToProdArray)
 {
 
  //*******Today date
         
             



        TodayDate=document.aspnetForm.TodayDate.value 
        DoneWithData="";
       
        $.ajax({
                type: 'POST',
                url: 'WebService.asmx/SendDataToDataBase',
                data: "{Lang_id: '" + Lang_id + "',Job_No: '" + Job_No + "',Wave_No: '" + Wave_No + "',Task_No: '" + Task_No + "',Chain_No: '" + Chain_No + "',Store_No: '" + Store_No + "',Merch_no: '" + Merch_no + "',Visit_Date: '" + Visit_Date + "',Q_no: '" + Q_no + "',strQ_Res: '" + strQ_Res + "',Prod_upc: '" + Prod_upc + "',PhotoDelMovArray: '" + StrSendToProdArray + "',TodayDate: '" + TodayDate + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                beforeSend: function () {
                  
                     //$("#DisplayInfo").html("<h2><span id='message_txt' class='LabelBlack' style='color:Red;font-weight:bold;'>Please wait</span></h2>"); 
                     //$('#myModal').modal('show'); 
                         // MessageText="Please Wait......";
                          //MessageDisplaySubmit(MessageText)
                        //$(".cover").show();

                         $('#myPleaseWait').modal('show');
                },
                complete: function () {
                  
                       //  alert("Done1");
                        // MessageText="Done";
                         //MessageDisplaySubmit(MessageText)
                        // SubmitPage()

                },
                success: function (data) {
 
                var obj = JSON.parse(data);
                   // alert("Done1");
                  
                   
                     StrAllHTMLtext=""; 
                     StrHTMLSaveBtntext="";
                     StrPhotoName=""; 
                     PhotoCnt=0;
                     ErrorMessage="";
                    setTimeout(
                          function () 
                            {
                               // alert("success!");
                              // StrAllHTMLtext=CreateTableHeaderHTML(Q_no)
                              // alert("StrAllHTMLtext=" + StrAllHTMLtext) 
             
                            $.each(obj, function (i, item) {
                                   
                                  ErrorMessage=item.ErrorMessage
                                   //alert("ErrorMessage=" + ErrorMessage) 
                              })
                              if (ErrorMessage=="Done")
                              {
                                alert('<%=vPrompts[32]%>')
                                SubmitPage()
                              }
                              
                        //  alert("ErrorMess_www=" + ErrorMessage) 
                          },
                    1000);
                    // alert("good=" + DoneWithData) 
                   // setTimeout(SubmitPage(),5000);
                       // SubmitPage()
                     return false;

                },
                error: function (msg) 
                {
                    // alert(msg.responseText);
                      // MessageText="Error occurred: The was unable to delete the photo.";
                      // alert("Error occurred: The was unable to delete the photo.");
                      alert('<%=vPrompts[31]%>')
                       //MessageDisplaySubmit(MessageText)
                }  
                
            });
           
         //  alert("DoneWithData=" + DoneWithData) 
            return false;      
 }
 function MessageDisplaySubmit(MessageText)
 {
            $('#DisplaySendDataError').html("" + MessageText + "");  
            el =  document.getElementById("DisplaySendDataError") 
            Divtextid="DisplaySendDataErrorObj";
            //$('#GetQuestionInfo'+ ArrCnt +'').html("" + HTMLQuestionText + "");  	
            txt = eval("document.getElementById('" + Divtextid + "')");
            //alert('txt=' + txt)

            var p = GetScreenCordinates(txt);
            alert("X:" + p.x + " Y:" + p.y)

            x = p.x-400;
            y = p.y-400;
            el.style.left = x + "px";
            el.style.top = y + "px";
            // el.style.position="absolute";
            el.style.display = "block";
 }
 
//*******************************************gets postion of the element
     function GetScreenCordinates(obj) {
         var p = {};
         p.x = obj.offsetLeft;
         p.y = obj.offsetTop;
         while (obj.offsetParent) {
             p.x = p.x + obj.offsetParent.offsetLeft;
             p.y = p.y + obj.offsetParent.offsetTop;
             if (obj == document.getElementsByTagName("body")[0]) {
                 break;
             }
             else {
                 obj = obj.offsetParent;
             }
         }
         return p;
     }
 
//************************** popup selected question
     
function CreateMoveQuestionHTML(ArrCnt,P_Q_no,Pick_Q_Res) 
{
  // alert("CreateMoveQuestionHTML=" + P_Q_no) 
    //*** Question Header Array
    //document.getElementById('DivPopUP_Ele_Name').value="";
    
   
   
    HTMLTextQ = "";
    Answer_Type = "";
    ControlName = "";
    Prod_id="";
     
    Stronclose = 'onclick="return ClosePopup(' + ArrCnt + ');"';
 
    HTMLTextQ = HTMLTextQ + "<table border='1' width='100%'  bordercolor='dodgerblue'>";
    RCA = 0
   // alert("step1") 
     
                        StrQ_no = document.getElementById('DivPopUP_Move_Q_no').value
                      //  alert("StrQ_no=" + StrQ_no) 
                        QHName = "Q" + StrQ_no
                        QuestionText = eval("document.getElementById('" + QHName + "').value")

                        POS = QuestionText.indexOf("_")
                        Ans_Type = QuestionText.substring(0, POS)
                       // alert("Ans_Type=" + Ans_Type) 
                        poslen = QuestionText.length;

                        Q_Text = QuestionText.substring(POS + 1, poslen)

                    //   alert("Q_Text=" + Q_Text) 
 
                        //DisplayQ_text = Question_no + " - " + Q_Text
                        DisplayQ_text = Q_Text
                        if (Ans_Type == "C") {
                                 Answer_Type = '<%=vPrompts[14]%>';
                                ControlName = ControlName + "C" + StrQ_no + "0" + Prod_id + "|";
                        }
                        if (Ans_Type == "D") {
                                Answer_Type = '<%=vPrompts[18]%>';
                                DateRule = eval("document.getElementById('" + DateRule + "').value") 
                                Answer_Type = Answer_Type.replace("mm/dd/yyyy", DateRule)

                                ControlName = ControlName + "D" + StrQ_no + "0" + Prod_id + "|";
                        }
                        if (Ans_Type == "N") {
                                Answer_Type = '<%=vPrompts[19]%>';
                                ControlName = ControlName + "N" + StrQ_no + "0" + Prod_id + "|";
                        }
                        if (Ans_Type == "T") {
                                Answer_Type = '<%=vPrompts[17]%>';
                                ControlName = ControlName + "T" + StrQ_no + "0" + Prod_id + "|";
                        }
                        if (Ans_Type == "L" || Ans_Type == "R") {
                                Answer_Type = '<%=vPrompts[15]%>';
                                if (Ans_Type == "L") {
                                    ControlName = ControlName + "L" + StrQ_no + "0" + Prod_id + "|";
                                }
                                if (Ans_Type == "R") {
                                    ControlName = ControlName + "R" + StrQ_no + "0" + Prod_id + "|";
                                }
                        }
                        if (Ans_Type == "P" || Ans_Type == "M" || Ans_Type == "H") 
                        {
                                Answer_Type = '<%=vPrompts[16]%>';
                                if (Ans_Type == "P") {
                                    ControlName = ControlName + "P" + StrQ_no + "0" + Prod_id + "|";
                                    ControlName = ControlName + "P" + StrQ_no + "1" + Prod_id + "|";
                                }
                                if (Ans_Type == "M") {
                                    ControlName = ControlName + "M" + StrQ_no + "0" + Prod_id + "|";
                                    ControlName = ControlName + "M" + StrQ_no + "1" + Prod_id + "|";
                                }
                                if (Ans_Type == "H") {
                                    ControlName = ControlName + "H" + StrQ_no + "0" + Prod_id + "|";
                                    ControlName = ControlName + "H" + StrQ_no + "1" + Prod_id + "|";
                                }
                        }
        Answer_Type="";
        HTMLTextQ = HTMLTextQ + "<tr  style='background-color:LightYellow;'>";
        HTMLTextQ = HTMLTextQ + "<td class='selectionCriteriaItem'>QNo.</td>";
        HTMLTextQ = HTMLTextQ + "<td class='selectionCriteriaItem'><B>" + DisplayQ_text + "<span style='color:red;'> " + Answer_Type + " </span></B></td>";
        HTMLTextQ = HTMLTextQ + "</tr>";
      //}
        
       //QuestionArray = eval("document.getElementById('" + AllQuestionArray + "').value")
      // alert("HTMLTextQ=" + HTMLTextQ) 
    
        HTMLResponseText = GetMoveQuestionResponse(Ans_Type, StrQ_no,P_Q_no,Pick_Q_Res)
      HTMLTextQ = HTMLTextQ + "" + HTMLResponseText
       // alert("HTMLTextQ=" + HTMLTextQ) 
         //Each_Ele_name=document.getElementById('DivPopUP_Ele_Name').value 
     
   
      
    HTMLTextQ = HTMLTextQ + "</Table>";
  //alert("HTMLTextQ=" + HTMLTextQ) 
    //Display the call form    
   // ProdQuestion.innerHTML = HTMLTextQ;
   return HTMLTextQ;
}

//**************************************** Get the responses for each question 
function GetMoveQuestionResponse(Ans_Type, StrQ_no,P_Q_no,Pick_Q_Res) 
{
    //alert("responseIn")
        Prod_id="";
        CBSavlength=0
   // DateRule = eval("document.getElementById('DateRule').value")
//alert("GetMoveQuestionResponse=" + P_Q_no) 
       // PQR_Pos = Pick_Q_Res.indexOf("-")
      //  Sel_Ans_Val = Pick_Q_Res.substring(0, PQR_Pos)
      // alert("Ans_Type=" + Ans_Type)
      Save_Res_val=document.getElementById('DivPopUP_Move_Q_Res').value
      // alert("Save_Res_val=" + Save_Res_val) 
      
      //save click checkboxes answers
        if (Ans_Type="C")
        {
              if (Save_Res_val!="")
              {
                    CBsavArray = Save_Res_val.split("|");
                    CBSavlength = CBsavArray.length
                   // alert("CBsavArray=" + CBsavArray)
                   // alert("CBSavlength=" + CBSavlength)
              }
        }
      
    Sel_Ans_Val = Pick_Q_Res;
    RTname = "R" + StrQ_no
    ResponseText = eval("document.getElementById('" + RTname + "').value")
   // alert("ResponseText=" + ResponseText) 

   

    RTArray = ResponseText.split("|");
    RTlength = RTArray.length
 
    RTlength = eval(RTlength)
    RTlength = RTlength - 1;
    POPUP_ArrayEle="";

    HTML_Ele = "";
    HTML_Ele = HTML_Ele + "<tr>";
    HTML_Ele = HTML_Ele + "<td class='selectionCriteriaItem'>Ans</td>";
    HTML_Ele = HTML_Ele + "<td>";
    HTML_Ele = HTML_Ele + "<Table border='0'>";


    for (q = 0; q < RTlength; q++) {
        RTArrayText = RTArray[q].valueOf()
      //   alert("RTArrayText=" + RTArrayText) 

        //************** get answer values
        POS = RTArrayText.indexOf("-")
        if (POS<0)
        {
                Ans_Val = "0" 
                Ans_Text = RTArrayText  
        }
        else
        {
            
                Ans_Val = RTArrayText.substring(0, POS)
                // alert("Ans_Val=" + Ans_Val) 
                //************** get response text			 
                poslen = RTArrayText.length;
               
                Ans_Text = RTArrayText.substring(POS + 1, poslen)
        }
        
       
        
        if (Ans_Type="C")
        {
                if (CBSavlength>0)
                {
                    var MatchArr = CBsavArray.indexOf(Ans_Val);
                   //alert("MatchArr=" + MatchArr) 
                }
                if (MatchArr>=0)
                {
                    HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
                    HTML_Ele = HTML_Ele + "<div id='rad_Span" + P_Q_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
                    HTML_Ele = HTML_Ele + "</div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
                    HTML_Ele = HTML_Ele + "</td></tr>"; 
                }
         }
         else
         {
                HTML_Ele = HTML_Ele + "<tr><td class='selectionCriteriaItem'>";
                HTML_Ele = HTML_Ele + "<div id='rad_Span" + P_Q_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
                HTML_Ele = HTML_Ele + "</div><span style='color:red;'>" + Ans_Val + "</span> - " + Ans_Text + "";
                HTML_Ele = HTML_Ele + "</td></tr>"; 
         } 
    }
    HTML_Ele = HTML_Ele + "</Table>";
    HTML_Ele = HTML_Ele + "</td>";
    HTML_Ele = HTML_Ele + "</tr>";
   
    return HTML_Ele;
}
function SubmitPage()
{
        document.aspnetForm.action  = "CFPictureByQuestionList.aspx";
        document.aspnetForm.submit();
		return false;
}


</script>


<hr color="dodgerblue">

<asp:Table ID="Table1" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table2" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
            <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader" >
                         <asp:Label ID="Label1" runat="server" Text="Job No."  class="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem" >
                        :<%=Job_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label2" runat="server" Text="Wave No."   CssClass="reportCriteriaHeader"></asp:Label>  
                   
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Wave_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                        <asp:Label ID="Label3" runat="server" Text="Task No."  CssClass="reportCriteriaHeader"></asp:Label>       
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Task_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label4" runat="server" Text="Chain No."  CssClass="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Chain_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label5" runat="server" Text="Store No."  CssClass="reportCriteriaHeader"></asp:Label>      
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Store_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                       <asp:Label ID="Label6" runat="server" Text="Visit Date."  CssClass="reportCriteriaHeader"></asp:Label>      
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        <%=Display_Job_Visit_Date%>
                </asp:TableCell>
            </asp:TableRow> 
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue">
 
<asp:Label ID="Q_Confirmation_txt" Font-Bold="true" ForeColor="Red" runat="server" Text="Visit Confirmation No."  SkinID="LabelBlackSkin"></asp:Label>
<asp:Label ID="Display_Q_Confirmation_No" Font-Bold="true" ForeColor="Black" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
 <br />
  <center>
<asp:Label ID="Display_Q_Confirmation_Msg" Font-Bold="true" ForeColor="Red" runat="server" Text=""  SkinID="LabelBlackSkin"></asp:Label>
  <br />
  <asp:Label ID="Display_Q_Confirmation_Msg2" runat="server" Font-Bold="true" ForeColor="#669900" Font-Size="Medium" Text="If you do not submit your photos you will not be paid per client directives. Do not close the screen" SkinID="LabelBlackSkin"></asp:Label>
  <br />
<div id="ShowJWTInfo" runat="server">
 
</div> 

 <asp:GridView  ID="PhotoQGrid"   Width="80%" DataKeyNames="q_no,Response_Val,Prod_upc,upc_desc,q_desc,Res_desc" Font-Size="Medium"  BorderColor="DodgerBlue"  AutoGenerateColumns="false"   OnRowDataBound="CreateButtonLink" RowStyle-CssClass="reportTableItem"  HeaderStyle-CssClass="reportTableHeadernew"  runat="server">
<Columns>
     <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="upc_desc"/>
     <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="q_desc"/>
     <asp:BoundField ItemStyle-HorizontalAlign="Left" DataField="Res_desc"/>
    <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Photo_count"/>
    <asp:TemplateField>
      
     <HeaderTemplate>
     
         <asp:Label ID="nothing" runat="server" Text="" CssClass="reportCriteriaHeader"></asp:Label>  
                
   </HeaderTemplate>
   <ItemTemplate>
    
     <asp:Button   ID="PhotoBttton_Status" runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
     
   </ItemTemplate>
    </asp:TemplateField>
</Columns> 
</asp:GridView>
   
<br />
   <asp:Button OnClientClick="return DoSubmitBack()" ID="NextBtn"  runat="server" Text="Next >>" CssClass="Button"></asp:Button>
 
    &nbsp&nbsp
   <asp:Button   ID="PhotoNoQuestion_bnt" runat="server" Visible="false" Text="Photo Upload (Without Questions)"   OnClientClick="return PhotoWithoutQuestion()" CssClass="Button"></asp:Button>
  <br />
<%

if (Job_No == "100911")
{	
%>
 <br />
	<TABLE width="100%" align="center" border="0">
		<TR>
			<td align="middle" width="100%"><A class="linkstyle" href="https://mars.sourceinterlink.com">Click here to report your time into M.A.R.S. (Michigan stores excluded)</A>
			</td>
		</TR>
		
	</TABLE>
 <br />
<%
}
%>
<br />
 <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog" style="z-index: 1400;">
        <br /><br /><br /><br /><br /><br />
          <div class="modal-dialog modal-lg" style="width:40%">

            <!-- Modal content-->
            <div class="modal-content" >
            <div class="modal-header" style="background-color:#1E90FF;">
                           <button type="button" class="close"  id="closeModal" data-dismiss="modal">
                            &times;</button>
                           <h4 class="modal-title" ><asp:Label ID="Label9" runat="server" Text="Select photo(s) to delete"  CssClass="reportTableHeader"></asp:Label> 
                            </h4>
                          </div>
              <div class="modal-body">
              
                <div class="row">
                   <div id="DisplayInfo"></div>
                </div>
              </div>
            </div>

          </div>
        </div>
 
    <div id="MoveQuestionDiv" class="modal fade" role="dialog" style="z-index: 1600;">
        <br /><br /><br /><br /><br /><br />
          <div class="modal-dialog modal-lg" style="width:50%">

            <!-- Modal content-->
            <div class="modal-content">
            <div class="modal-header">
                           <button type="button" class="close"  id="Button1" data-dismiss="modal">
                            &times;</button>
                           <h4 class="modal-title">
                            </h4>
                          </div>
              <div class="modal-body">
              
                <div class="row">
                   <div id="Div22"><asp:Label ID="Label7" runat="server" Text="questions"  CssClass="reportTableHeader"></asp:Label></div>
                </div>
              </div>
            </div>

          </div>
        </div>

    <!-- End of modal -->
<div id="ProdQuestion"     style="display: none; position: absolute; left: 130px; top: 50px; border: solid black 1px; padding: 10px; background-color:White; text-align: justify; font-size: 12px; width: 350px;z-index: 1400;"></div>
<div id="display"  ></div>
  <div id="shadow" class="opaqueLayer"> </div>
 <div id="question" class="questionLayer"></div>
 
 <div class="modal fade bs-example-modal-sm" id="myPleaseWait" tabindex="1" style="z-index:9999999;top:50%;" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                     <asp:Label ID="Label8" runat="server" Text="Please wait while the system is processing your request."  CssClass="reportCriteriaHeader"></asp:Label>      
                 </h4>
            </div>
            <div class="modal-body">
                <div class="progress">
                    <div class="progress-bar progress-bar-info
                    progress-bar-striped active"
                    style="width: 100%">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

 

<br />
  <%=DisplayJWTQuestionsInfo%>
           <br />
  <%=DisplayResponseInfo%>
           <br />
 <%=DisplayPQListInfo%>
 <br />
 <%=DisplayProdList%>
 <br />
  <%=DisplayProdqList%>
 <br />
   <%=DisplaySaveBacklist%>
 <br />
   <%=DisplaySavelist%>
 <br />
  <%=DisplayProdUPCList%>
 <br />
 
<input id="CallFormType_no" type="hidden" value="<%=Photo_q_CF_type_No%>" />     
<input id="Lang_id" type="hidden" value="<%=Lang_id%>" />     
<input id="PopUp_P_id" type="hidden" />    
<input id="PopUpPhotoCnt" type="hidden" />  
<input id="DivPopUP_Move_Q_no" type="hidden" />  
<input id="DivPopUP_Move_Q_Res" type="hidden" />  
<input id="DivPopUP_R_typeQ" type="hidden"/>   
<input id="DivPopUP_Ele_Name" type="hidden"/>      
<input name="OldQ_PopUp_val" type="hidden" value="" />	               
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="" />	
<input name="Job_Visit_Date" type="hidden" value="<%=Job_Visit_Date%>" />
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />

<input name="Photo_Q_Enable" type="hidden" value="Y"/>
<input name="store_id" type="hidden" value="<%=store_id%>" />

<input name="Chain_No" type="hidden" value="<%=Chain_No%>" />
<input name="Store_Chain_Desc" type="hidden" value="<%=Store_Chain_Desc%>" />
<input name="Store_No" type="hidden" value="<%=Store_No%>" />
<input name="Store_Store_Name" type="hidden" value="<%=Store_Store_Name%>" />
<input name="Store_Street_Addr" type="hidden" value="<%=Store_Street_Addr%>" />
<input name="Store_City" type="hidden" value="<%=Store_City%>" />
<input name="Store_State" type="hidden" value="<%=Store_State%>" />
<input name="Store_Zip" type="hidden" value="<%=Store_Zip%>" />

<input name="CA_merch_no"  type="hidden" value="<%=CA_merch_no%>" />

<input name="Type_Browser"  type="hidden" value="<%=Type_Browser%>" />

<input name="Type_Chrome"  type="hidden" value="<%=Type_Chrome%>" />
<input id="Merch_no" type="hidden" runat="server" />
<input name="Str_Merch_no" type="hidden" value="<%=Str_Merch_no%>" />

<input name="Merch_First_Name" type="hidden" value="<%=Merch_First_Name%>" />
<input name="Merch_Last_Name" type="hidden" value="<%=Merch_Last_Name%>" />
<input name="Merch_Street_Addr" type="hidden" value="<%=Merch_Street_Addr%>" />
<input name="Merch_Street_Addr2" type="hidden" value="<%=Merch_Street_Addr2%>" />
<input name="Merch_City" type="hidden" value="<%=Merch_City%>" />
<input name="Merch_State" type="hidden" value="<%=Merch_State%>" />
<input name="Merch_Zip" type="hidden" value="<%=Merch_Zip%>" />
<input name="Merch_Phone_No" type="hidden" value="<%=Merch_Phone_No%>" />
<input name="Merch_Email_Addr" type="hidden" value="<%=Merch_Email_Addr%>" />


<input name="Field_Start_Dt" type="hidden" value="<%=Field_Start_Dt%>" />
<input name="Field_end_Dt" type="hidden" value="<%=Field_end_Dt%>" />
<input name="Key_Comp_Dt" type="hidden" value="<%=Key_Comp_Dt%>" />
<input name="DOA_Dt" type="hidden" value="<%=DOA_Dt%>" />		
	
<input name="TodayDate" type="hidden" value="<%=TodayDate%>" />		
			
<input name="visit_no" type="hidden" value="<%=visit_no%>" />

<input name="Collect_iVR_Time" type="hidden" value="<%=Collect_iVR_Time%>" />
<input name="night_visits" type="hidden" value="<%=night_visits%>" />
<input name="Mileage_flag" type="hidden" value="<%=Mileage_flag%>" />
<input name="Travel_flag" type="hidden" value="<%=Travel_flag%>" />

<input name="Job_Type" type="hidden" value="<%=Job_Type%>" />
<input name="Business_Type_id" type="hidden" value="<%=Business_Type_id%>" />

<input name="Work_Type_id" type="hidden" value="<%=Work_Type_id%>" />
<input name="Work_Type_Desc" type="hidden" value="<%=Work_Type_Desc%>" />

<input name="Data_Col_Method" type="hidden" value="<%=Data_Col_Method%>" />
<input name="overwritetime" type="hidden" value="<%=overwritetime%>" />
<input name="All_Data_Received" type="hidden" value="<%=All_Data_Received%>" />
<input name="collect_time_only" type="hidden" value="<%=collect_time_only%>" />
<input name="Ask_Q_HH_Used" type="hidden" value="<%=Ask_Q_HH_Used%>" />
<input name="HH_Status_Flag" type="hidden" value="<%=HH_Status_Flag%>" />

<input name="Collect_Header" type="hidden" value="<%=Collect_Header%>" />
<input name="Collect_Call_Form" type="hidden" value="<%=Collect_Call_Form%>" />

<input name="SS_Callform" type="hidden" value="<%=SS_Callform%>" />
<input name="Prod_Specific" type="hidden" value="<%=Prod_Specific%>" />
<input name="qdef_skippattern" type="hidden" value="<%=qdef_skippattern%>" />

<input name="Max_Mx_Per_Store" type="hidden" value="<%=Max_Mx_Per_Store%>" />
<input name="Max_Visit_Per_Store_Mx" type="hidden" value="<%=Max_Visit_Per_Store_Mx%>" />

<input name="Collect_Store_Mgr_Name" type="hidden" value="<%=Collect_Store_Mgr_Name%>" />

<input name="Product_Check_Flag" type="hidden" value="<%=Product_Check_Flag%>" />

<input name="Ask_EShelf_Question" type="hidden" value="<%=Ask_EShelf_Question%>" />

<input name="Call_Form_Type_No" type="hidden" value="<%=Call_Form_Type_No%>" />

<input name="Est_instore_minutes" type="hidden" value="<%=Est_instore_minutes%>" />
<input name="Business_Rule_Eckerd" type="hidden" value="<%=Business_Rule_Eckerd%>" />
<input name="Eckerd_Job_Last_question" type="hidden" value="<%=Eckerd_Job_Last_question%>" />

<input name="user_id" type="hidden" value="<%=user_id%>" />
<input name="PhotoButton" type="hidden" value="<%=PhotoButton%>" />
<input name="Bus_Rule5_Question" type="hidden" value="<%=Bus_Rule5_Question%>" />
<input name="Bus_Rule6_Question" type="hidden" value="<%=Bus_Rule6_Question%>" />
<input name="Bus_Rule28_Question" type="hidden" value="<%=Bus_Rule28_Question%>" />
<input name="Bus_Rule3_Question" type="hidden" value="<%=Bus_Rule3_Question%>" />
<input name="Bus_Rule4_Question" type="hidden" value="<%=Bus_Rule4_Question%>"  />
<input name="Bus_Rule7_Question" type="hidden" value="<%=Bus_Rule7_Question%>"  />

<%//From page CFJWTValidateSV.aspx %>
<input name="StrSwitchServerFlag" type="hidden" value="<%=StrSwitchServerFlag%>" />

<input name="Str_VisitMonth" type="hidden" value="<%=Str_VisitMonth%>" />
<input name="Str_visitday" type="hidden" value="<%=Str_visitday%>" />
<input name="Str_visityear" type="hidden" value="<%=Str_visityear%>" />
<input name="Str_timein_hrs" type="hidden" value="<%=Str_timein_hrs%>" />
<input name="Str_timein_min" type="hidden" value="<%=Str_timein_min%>" />
<input name="Str_cmb_timein" type="hidden" value="<%=Str_cmb_timein%>" />
<input name="Str_timeout_hrs" type="hidden" value="<%=Str_timeout_hrs%>" />
<input name="Str_timeout_min" type="hidden" value="<%=Str_timeout_min%>" />
<input name="Str_cmb_timeout" type="hidden" value="<%=Str_cmb_timeout%>" />
<input name="Str_txt_mileage" type="hidden" value="<%=Str_txt_mileage%>" />
<input name="Str_txt_drive" type="hidden" value="<%=Str_txt_drive%>" />
<input name="Str_rad_q_Past_Midnight" type="hidden" value="<%=Str_rad_q_Past_Midnight%>" />
<input name="Str_rad_q_HH_Used" type="hidden" value="<%=Str_rad_q_HH_Used%>" />
<input name="Str_rad_q_Ret_store_visit" type="hidden" value="<%=Str_rad_q_Ret_store_visit%>" />
<input name="Str_Radio_EShelf" type="hidden" value="<%=Str_Radio_EShelf%>" />
<input name="Str_Ask_EShelf_Question" type="hidden" value="<%=Str_Ask_EShelf_Question%>" />
<input name="Str_Bus_Rule3_Question" type="hidden" value="<%=Str_Bus_Rule3_Question%>" />
<input name="Str_rad_q_BR3" type="hidden" value="<%=Str_rad_q_BR3%>" />
<input name="Str_Bus_Rule4_Question" type="hidden" value="<%=Str_Bus_Rule4_Question%>" />
<input name="Str_rad_q_BR4" type="hidden" value="<%=Str_rad_q_BR4%>" />
<input name="Str_Bus_Rule5_Question" type="hidden" value="<%=Str_Bus_Rule5_Question%>" />
<input name="Str_rad_q_BR5" type="hidden" value="<%=Str_rad_q_BR5%>" />
<input name="Str_Bus_Rule6_Question" type="hidden" value="<%=Str_Bus_Rule6_Question%>" />
<input name="Str_rad_q_BR6" type="hidden" value="<%=Str_rad_q_BR6%>" />
<input name="Str_Bus_Rule7_Question" type="hidden" value="<%=Str_Bus_Rule7_Question%>" />
<input name="Str_rad_q_BR7" type="hidden" value="<%=Str_rad_q_BR7%>" />
<input name="Str_Bus_Rule28_Question" type="hidden" value="<%=Str_Bus_Rule28_Question%>" /> 
<input name="Str_rad_q_BR28" type="hidden" value="<%=Str_rad_q_BR28%>" />
<input name="Str_Manager_Title" type="hidden" value="<%=Str_Manager_Title%>" /> 
<input name="Str_txt_Manager_name" type="hidden" value="<%=Str_txt_Manager_name%>" />
<input name="Client_Access_Flag" type="hidden" value="<%=Client_Access_Flag%>" />
<input name="Pre_Approved_Flag" type="hidden" value="<%=Pre_Approved_Flag%>" />
<input name="Photo_q_complete" type="hidden" value="<%=Photo_q_complete%>" />

<input name="Photo_Q_No" type="hidden" value="" />
<input name="Photo_q_Res_Val" type="hidden" value="" />
<input name="Photo_Prod_upc" type="hidden" value="" />
<input name="Photo_upc_desc" type="hidden" value="" />
<input name="Photo_q_desc" type="hidden" value="" />
<input name="Photo_Res_desc" type="hidden" value="" />
<input name="RTS_Url" type="hidden" value="<%=RTS_Url%>"/>
<input name="AppleIpadUsed" type="hidden" value="<%=AppleIpadUsed%>"/>
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<input name="StrNewCallFormPathLink" type="hidden" value="<%=StrNewCallFormPathLink%>"/>
<Input type="hidden" name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type="hidden" name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</center>
</asp:Content>

