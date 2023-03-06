<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFCallFormInputs.aspx.cs" Inherits="CFCallFormInputs" Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript"  language="javascript">
 
//if (navigator.appName == 'Netscape' && 
//(e.which == 3 || e.which == 2))
//return false;
//else if (navigator.appName == 'Microsoft Internet Explorer' && 
//(event.button == 2 || event.button == 3)) {
//alert("Sorry, you do not have permission to right click.");
//return false;
//}
//return true;
//}
document.oncontextmenu=new Function("return false")


 function CheckGoBack(e) 
 {
        var evt = e || window.event; 
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
        //alert("evt=" + node.type);
        var keyCode = evt.charCode || evt.keyCode; 
        //alert("keyCode=" + keyCode);
         if ((keyCode==8) && (node.type!="text"))  
             {
                return false;
             }

 }

 document.onkeydown = CheckGoBack;

function Load()
	{
		//This function is to display the answers when coming back from RTS Issues
		 DisplayAnswersFromRTS()

	if (document.aspnetForm.showCheck.checked==false)
			
			{
				document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML
	
				ShowDetail.innerHTML=""
			} 
	else
			{
				document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML

			} 			
	}
function GetDetail()
	{
	
	    if (document.aspnetForm.showCheck.checked)
		    {
		        //alert("StartArray1=" +   document.getElementById('ShowDetail').innerHTML)		 
		        ShowDetail.innerHTML=document.aspnetForm.InformationDisplay.value
		        //document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML
		    }
	    else
		    {
		            //alert("StartArray1=" + ShowDetail.innerHTML)
		            //alert("StartArray2=" + document.aspnetForm.InformationDisplay.value)
			        document.aspnetForm.InformationDisplay.value=ShowDetail.innerHTML;
			        ShowDetail.innerHTML="";
		    } 
	}
function noLeftClick()
{
         
         strtest=event.button;
        // alert(strtest);
         var  PageLoadCheck = document.getElementById("CallFormEnd");
           // alert("PageLoadCheck=" + PageLoadCheck);
            if (PageLoadCheck != null)
            {
                 
            }
            else
            {
                // alert("noLeftClick=" + event.button); 
                 
                 if (event.button == 1 || event.button == 0)
                    {
                        alert("Please wait.....")
                         return false;
                    }
            }  
}
  

function Back_click()
	{
	   document.aspnetForm.action = "CFJWTInputs.aspx";
	   document.aspnetForm.submit();
	   return true;	
	}

function DisableButtons()
	{
	     //******* Disabled the buttons
		document.aspnetForm.ctl00$ContentPlaceHolder1$Update.disabled=true;
	}
function AbleButtons()
	{
	     //******* Disabled the buttons
		document.aspnetForm.ctl00$ContentPlaceHolder1$Update.disabled=false;
	}	
/*
enable or disable ('002 ','001 ','999.0000','1.0000')
*/
function submitonce(NextQuestion,Question,StartArray,HighVal,LowVal,StrRTS)
{

               
			  //alert("NextQuestion=" + NextQuestion);
			  //alert("Question=" + Question);
			 //alert("HighVal=" + HighVal);
			 //alert("LowVal=" + LowVal);
			 //alert("StrRTS=" + StrRTS);
			//merch_no(30769,74817,30918,89021,105859)
			 merch_no=document.aspnetForm.Str_Merch_no.value
			// alert("merch_no=" + merch_no);
			 ILang_Id=document.aspnetForm.ILang_Id.value
		   	 //alert("ILang_Id=" + ILang_Id);
		   	 Diff_q="";
		   	 StopLoop="";
			Q_no=Number(Question)
			Nxt_Q_no=Number(NextQuestion)
			if (Nxt_Q_no!="0")
				{
					StopLoop=Nxt_Q_no + 1 
					Diff_q=Nxt_Q_no-Q_no
				}
				//alert("Diff_q=" + Diff_q);
				Disable_questions="";
			if (Diff_q==1)
			{
			    Disable_questions="Y";
			}
		    // alert("Disable_questions=" + Disable_questions);
			Saved_Q_no=0
			ExitLoop=""
		//Getting all the questions 
			StrAllElements=document.aspnetForm.CallForm_Elements.value
			ArrayAllHtmlElement=document.aspnetForm.ArrayAllHtmlElement.value
		//For loop, getting a start value
			StrVal1=StartArray
			//alert("StrVal1=" + StrVal1);  ctl00_ContentPlaceHolder1
		//For loop, getting a ending value
			StrVal2=Number(NextQuestion)

			ArrayAList = StrAllElements.split("|");
			
			//alert("ArrayAllHtmlElement=" + ArrayAllHtmlElement);
		//***** Question before is answered or not 
			 //if (ILang_Id==1)
			 //var inputs = document.getElementsByTagName('groupname');
			 //lenginp=inputs.length
			 //alert("inputs=" + lenginp );
			 //{
						//if (QuestionStatus(Question,ArrayAllHtmlElement,StartArray)==false)
						//		{
									//alert("return false")
						//			return false;
							//	}
						 if (CheckHighLowVal(Question,ArrayAllHtmlElement,StartArray,HighVal,LowVal)==false)
						 		{
									//alert("return false2")
						 		    return false;
						 	    }		
								
			// }
			
			 //alert("StrVal1=" + StrVal1);
			arraylength = ArrayAList.length
			//alert("arraylength=" + arraylength) 
			arraylength=eval(arraylength-1)
			
				   //alert("StrVal1=" + StrVal1);
				 //alert("StrVal2=" + StrVal2);
				 //alert("arraylength=" + arraylength)           
			for ( i = StrVal1; i < arraylength ; i++ )
				{
						EachElement = ArrayAList[i].valueOf()
						//alert("EachElement=" + EachElement)
						  
						StrEle_Q_no = EachElement.substring(7,10)
				        
						Ele_Q_no=Number(StrEle_Q_no)
						 //alert("Ele_Q_no=" + Ele_Q_no)
						Ans_Type = EachElement.substring(0,7)
						 //alert("Ans_Type=" + Ans_Type) 
						 //ctl00_ContentPlaceHolder1_rad_qno001
						 EachElement="ctl00$ContentPlaceHolder1$" + EachElement + "";
					   // k=eval("document.aspnetForm.ctl00$ContentPlaceHolder1$rad_qno001.value")
					   //**************** Check for high and low values
					   //alert("EachElement=" + EachElement) 
						  //alert("Ele_Q_no=" + Ele_Q_no) 
						  //alert("Nxt_Q_no=" + Nxt_Q_no) 
						// alert("Q_no=" + Q_no)
						if (Ele_Q_no>=Nxt_Q_no)
						    {
						          Disable_questions="Y";
						         //alert("Disable_questionsInside=" + Disable_questions);
						    }  
						    
						
						if (Ele_Q_no<=Q_no)
						{
							CheckRTS(EachElement,Ans_Type,Question,Ele_Q_no,StrRTS)
						}
						
						if (Ele_Q_no>Q_no)
						{
							 //alert("test")  
							if (Nxt_Q_no==0)
								{	
								     //alert("Disabled Everything")  
									QuestionDisabled(EachElement,Ans_Type)
									
								}
							else
								{
										 //alert("Saved_Q_no=" + Saved_Q_no)  
										 //alert("Ele_Q_no=" + Ele_Q_no) 
										 //alert("Nxt_Q_no=" + Nxt_Q_no) 
										if (Saved_Q_no>Ele_Q_no)
											{
												ExitLoop="Y"
												//alert("ExitLoop")  
											}
										if (Ele_Q_no<Nxt_Q_no)
											{
													 // alert("Disabled")  
													
													    QuestionDisabled(EachElement,Ans_Type)	
											}
										if (Ele_Q_no>=Nxt_Q_no)
											{
											        // alert("Disable_questions=" + Disable_questions) 
											        // alert("Ele_Q_no=" + Ele_Q_no) 
													// alert("ENabled")  
													 
													            QuestionEnabledEdit(EachElement,Ans_Type,Disable_questions)
													 
											}
										if ((Ans_Type=="txt_Dol")||(Ans_Type=="txt_Cen")||(Ans_Type=="txt_Fee")||(Ans_Type=="txt_Inc")||(Ans_Type=="txt_Hou")||(Ans_Type=="txt_Min"))
											{
														if (ExitLoop=="Y")
															{
																StopLoop="0"
																//return false;	
															}
											}
										else	
											{
												if ((Ele_Q_no>=Nxt_Q_no)&&(Nxt_Q_no!=0))
													{	 
													    //alert("GoToRTS")  
														//GoToRTS()
														return false;	
													}	
											}	
								} 
						}//Ending of (Ele_Q_no>Q_no)
						Saved_Q_no=Ele_Q_no+1	
				}//Ending of for loop
				//GoToRTS()
}

function CheckRTS(EachElement,Ans_Type,Question,Ele_Q_no,StrRTS)
{
             //alert("RTS=" + EachElement)
              //alert("StrRTS=" + StrRTS)
			if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))	
			{	
													
							k=eval("document.aspnetForm." + EachElement + ".length")
							//alert("k55=" + k)	
							LenCheck=String(k)
																	
							if (LenCheck=="undefined")
									{
														tempobj=eval("document.aspnetForm." + EachElement + "")
														eval("document.aspnetForm." + EachElement + ".value='" + StrRTS + "'")
														textBoxValue=eval("document.aspnetForm." + EachElement + ".value")
														 // alert("textBoxValue=" + textBoxValue)
														RTSIssuesCheck(Question,Ele_Q_no,StrRTS,tempobj,EachElement)
														//RTSIssuesCheck(Question,QuestionValue,textBoxValue,tempobj,textname)
							 
								
									}					
							else
									{
												for (m=0; m<k; m++)
													{
														tempobj=eval("document.aspnetForm." + EachElement + "[m]")
														eval("document.aspnetForm." + EachElement + "[m].value='" + StrRTS + "'")
														textBoxValue=eval("document.aspnetForm." + EachElement + "[m].value")
														//alert("EachElement=" + EachElement)
														//alert("textBoxValue111=" + textBoxValue)
														RTSIssuesCheck(Question,Ele_Q_no,StrRTS,tempobj,EachElement)		
													}
									}
			}//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
}
//************************** Check for RTS
function GoToRTS()
{
				Here_RTS_Issue=document.aspnetForm.Here_RTS_Issue.value
				//alert("Here_RTS_Issue=" + Here_RTS_Issue) 
				ILang_Id=document.aspnetForm.ILang_Id.value
				//alert("ILang_Id=" + ILang_Id) 
				Here_RTS_Issue="N";
				if (Here_RTS_Issue=="Y")
				{	
							document.aspnetForm.Here_RTS_Issue.value=''
							 RTS_Merch_Access=document.aspnetForm.Str_Merch_no.value 
							 RTS_Merch_Access=Trim(RTS_Merch_Access)
							 //alert("RTS_Merch_Access=" + RTS_Merch_Access);					
							RTS_Saving_Answers()
							document.aspnetForm.ctl00$ContentPlaceHolder1$Update.disabled=true;
		                   // alert("RTS_Merch_Access1=" + RTS_Merch_Access);
		                   //document.aspnetForm.action="http://dev2k3.sparinc.com/its/its_IssueAddNext.aspx"
		                    //document.aspnetForm.action="/its/its_issueaddnext.asp"
		                    // document.aspnetForm.action="http://mitest.sparinc.com/its/its_issueaddnext.asp"
		                    //**************** old link
		                   // document.aspnetForm.action="http://mi23.sparinc.com/its/its_issueaddnext.asp"
		                    //**************** New link
		                    // document.aspnetForm.action="http://mi23.sparinc.com/itsnet/its_IssueAddNext.aspx"
		                    //document.aspnetForm.action="http://mitest.sparinc.com/ITS_mfo/its_issueaddnext.asp"
		                     RTS_Url=document.aspnetForm.RTS_Url.value
		                     document.aspnetForm.action=RTS_Url; 
		                    document.aspnetForm.submit();
				            return false;
            					 	
							
																
				}
}

//************************** Disabled the questions 
function QuestionDisabled(EachElement,Ans_Type)
{
			StrEle_Q_no = EachElement.substring(EachElement.length-3,EachElement.length)
			  // alert("QuestionDisabledEachElement=" + EachElement) 
			  //alert("Ans_Type=" + Ans_Type) 
			  // alert("StrEle_Q_no=" + StrEle_Q_no) 
			  
			if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))	
			{	
													
							k=eval("document.aspnetForm." + EachElement + ".length")
							// alert("k55=" + k)	
							LenCheck=String(k)
							StrSpanName="rad_Span" + StrEle_Q_no + "";
							 					
							if (LenCheck=="undefined")
									{
									                     StrSpanEle="" + StrSpanName + "0";
														eval("document.aspnetForm." + EachElement + ".checked=false")
														eval("document.aspnetForm." + EachElement + ".disabled=true")
														//eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'red'")
														eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")
									}					
							else
									{
												for (j=0; j<k; j++)
													{
													    StrSpanEle="" + StrSpanName + "" + j + "";
													    //alert("StrSpanEle_Disabled=" + StrSpanEle)	
														eval("document.aspnetForm." + EachElement + "[j].checked=false")
														
														eval("document.aspnetForm." + EachElement + "[j].disabled=true")
														//eval("document.aspnetForm." + EachElement + "[j].style.backgroundColor = 'red'")
														eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")
	
													}
									}
			}//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
											   
			if ((Ans_Type=="txt_num")||(Ans_Type=="txt_dat")||(Ans_Type=="txt_txt")||(Ans_Type=="txt_Dol")||(Ans_Type=="txt_Cen")||(Ans_Type=="txt_Fee")||(Ans_Type=="txt_Inc")||(Ans_Type=="txt_Hou")||(Ans_Type=="txt_Min"))	
			 	{	
			 		eval("document.aspnetForm." + EachElement + ".value=''")
			 		eval("document.aspnetForm." + EachElement + ".readonly='true'")
			 		eval("document.aspnetForm." + EachElement + ".disabled='true'")
			 		eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'red'")
														
			 	}
			 if (Ans_Type=="txt_txt")
				{																				
					strtxt="ctl00$ContentPlaceHolder1$Counter" + StrEle_Q_no
					eval("document.aspnetForm." + strtxt + ".value=''")
					eval("document.aspnetForm." + strtxt + ".style.backgroundColor = 'red'")
				}			
	
}
//************************** Enabled the questions 
function QuestionEnabledEdit(EachElement,Ans_Type,Disable_questions)
{
           // alert("QuestionEnabled=" + EachElement) 
           // alert("Ans_Type=" + Ans_Type) 
           // alert("Disable_questions=" + Disable_questions) 
			StrEle_Q_no = EachElement.substring(EachElement.length-3,EachElement.length)
			// alert("StrEle_Q_no=" + StrEle_Q_no)	
			  //alert("Ans_Type=" + Ans_Type)	
			if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))	
			{	
													
							k=eval("document.aspnetForm." + EachElement + ".length")
							//alert("k55=" + k)	
							LenCheck=String(k)
							StrSpanName="rad_Span" + StrEle_Q_no + "";										
							if (LenCheck=="undefined")
									{
									                 Q_status=eval("document.aspnetForm." + EachElement + ".disabled")
							                           // alert("Q_status=" + Q_status)
							                         if (Q_status==true)
							                           {
							                                Disable_questions="" 
							                           }
														           
						                             if (Disable_questions=="")
                                                        {
									                                StrSpanEle="" + StrSpanName + "0";
														            eval("document.aspnetForm." + EachElement + ".checked=false")
														            eval("document.aspnetForm." + EachElement + ".disabled=false")
														            //eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'mintcream'")
														            eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'mintcream'")
														 }		
									}					
							else
									{
												for (n=0; n<k; n++)
													{
													        Q_status=eval("document.aspnetForm." + EachElement + "[n].disabled")
							                                  // alert("Q_status=" + Q_status)
							                                 if (Q_status==true)
							                                   {
							                                        Disable_questions="" 
							                                   }
        														           
						                                     if (Disable_questions=="")
                                                                {
													                 StrSpanEle="" + StrSpanName + "" + n + "";
													                // alert("StrSpanEleEnbled=" + StrSpanEle)	
														            eval("document.aspnetForm." + EachElement + "[n].checked=false")
														            eval("document.aspnetForm." + EachElement + "[n].disabled=false")
														            //eval("document.aspnetForm." + EachElement + "[n].style.backgroundColor = 'mintcream'")
														            eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'mintcream'")
														         }		
													}
									}
			}//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
											   
			if ((Ans_Type=="txt_num")||(Ans_Type=="txt_dat")||(Ans_Type=="txt_txt")||(Ans_Type=="txt_Dol")||(Ans_Type=="txt_Cen")||(Ans_Type=="txt_Fee")||(Ans_Type=="txt_Inc")||(Ans_Type=="txt_Hou")||(Ans_Type=="txt_Min"))	
			 	{	
			 	            Q_status=eval("document.aspnetForm." + EachElement + ".disabled")
		                  // alert("Q_statusNTPMH=" + Q_status)	
		                     if (Q_status==true)
                              {
                                 Disable_questions="" 
                              }				   
		                      if (Disable_questions=="")
                              {			
			 		                eval("document.aspnetForm." + EachElement + ".value=''")
			 		                eval("document.aspnetForm." + EachElement + ".readonly=false")
			 		                eval("document.aspnetForm." + EachElement + ".disabled=false")
			 		                eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'white'")
			 		           }
														
			 	}
			 if (Ans_Type=="txt_txt")
				{		
				              Q_status=eval("document.aspnetForm." + EachElement + ".disabled")
		                     // alert("Q_statusNTPMH=" + Q_status)	
		                     if (Q_status==true)
                              {
                                 Disable_questions="" 
                              }				   
		                      if (Disable_questions=="")
                              {																				
					                strtxt="ctl00$ContentPlaceHolder1$Counter" + StrEle_Q_no
					                eval("document.aspnetForm." + strtxt + ".value=''")
					                eval("document.aspnetForm." + strtxt + ".style.backgroundColor = '#E0E0E0'")
					          }
				}		
	
}

//************************** Enabled the questions 
function QuestionEnabled(EachElement,Ans_Type)
{
           // alert("QuestionEnabled=" + EachElement) 
           // alert("Ans_Type=" + Ans_Type) 
			StrEle_Q_no = EachElement.substring(EachElement.length-3,EachElement.length)
			 //alert("StrEle_Q_no=" + StrEle_Q_no)	
			// alert("Ans_Type=" + Ans_Type)	
			if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))	
			{	
													
							k=eval("document.aspnetForm." + EachElement + ".length")
							//alert("k55=" + k)	
							LenCheck=String(k)
							StrSpanName="rad_Span" + StrEle_Q_no + "";										
							if (LenCheck=="undefined")
									{
									                    StrSpanEle="" + StrSpanName + "0";
														eval("document.aspnetForm." + EachElement + ".checked=false")
														eval("document.aspnetForm." + EachElement + ".disabled=false")
														//eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'mintcream'")
														eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'mintcream'")		
									}					
							else
									{
												for (n=0; n<k; n++)
													{
													     StrSpanEle="" + StrSpanName + "" + n + "";
													    // alert("StrSpanEleEnbled=" + StrSpanEle)	
														eval("document.aspnetForm." + EachElement + "[n].checked=false")
														eval("document.aspnetForm." + EachElement + "[n].disabled=false")
														//eval("document.aspnetForm." + EachElement + "[n].style.backgroundColor = 'mintcream'")
														eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'mintcream'")		
													}
									}
			}//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
											   
			if ((Ans_Type=="txt_num")||(Ans_Type=="txt_dat")||(Ans_Type=="txt_txt")||(Ans_Type=="txt_Dol")||(Ans_Type=="txt_Cen")||(Ans_Type=="txt_Fee")||(Ans_Type=="txt_Inc")||(Ans_Type=="txt_Hou")||(Ans_Type=="txt_Min"))	
			 	{	
			 		eval("document.aspnetForm." + EachElement + ".value=''")
			 		eval("document.aspnetForm." + EachElement + ".readonly=false")
			 		eval("document.aspnetForm." + EachElement + ".disabled=false")
			 		eval("document.aspnetForm." + EachElement + ".style.backgroundColor = 'white'")
														
			 	}
			 if (Ans_Type=="txt_txt")
				{																				
					strtxt="ctl00$ContentPlaceHolder1$Counter" + StrEle_Q_no
					eval("document.aspnetForm." + strtxt + ".value=''")
					eval("document.aspnetForm." + strtxt + ".style.backgroundColor = '#E0E0E0'")
				}		
	
}
//************************** High And Low Values
function CheckHighLowVal(Question,ArrayAllHtmlElement,StartArray,HighVal,LowVal)
{
            //Check for all questions and types
                ArrayPoint=eval(StartArray)
                ArrayHLElement=document.aspnetForm.ArrayAllQuestionsElement.value
                //alert("ArrayHLElement=" + ArrayHLElement);
                StrArrayHLLen = ArrayHLElement.split("|");

                HLElement = StrArrayHLLen[ArrayPoint].valueOf()
               // alert("HLElement=" + HLElement)
                StrHLQ_no = HLElement.substring(0,3)
                //alert("QuestionElement=" + QuestionElement)
                //alert("StrHLQ_no1=" + StrHLQ_no)
                StrHLQ_no=Number(StrHLQ_no)
                StrQ_type=HLElement.substring(4,5)
                
                StrCheckQuestion=Number(Question)
		       // alert("StrHLQ_no=" + StrHLQ_no)
		        
		     //Check for all elements and types
		        
		        StrArrayHLElen = ArrayAllHtmlElement.split("|");
		         HLElement2 = StrArrayHLElen[ArrayPoint].valueOf()
                 //alert("HLElement2=" + HLElement2)
                   HLElement2Val="ctl00$ContentPlaceHolder1$" + HLElement2 + "";

		        if (StrCheckQuestion==StrHLQ_no)
		        {
	                    if (StrQ_type=="N" || StrQ_type=="D" || StrQ_type=="P" || StrQ_type=="H" || StrQ_type=="M")
                        {
                                 
                                 
                                if (StrQ_type=="D")
                                    { 
                                             TextdatCheck=eval("document.aspnetForm." + HLElement2Val + ".value")
                             	               if (DatecheckNumber(TextdatCheck)==false)
									            {
									               alert('<%=vPrompts[44]%>' + " " + Question);
													 
													ElementOnFocus(HLElement2Val,StrQ_type)
                                                    return false;
									            }     
                             	            
                             	            if (DateValidation(TextdatCheck, document.aspnetForm.DateRule.value, '<%=vPrompts[45]%>')==false)
												{
													 alert('<%=vPrompts[44]%>' + " " + Question);
													 
													ElementOnFocus(HLElement2Val,StrQ_type)
													return false;
												}
                             	            
                             	            if (DateHighLowCheck(TextdatCheck,LowVal,HighVal,document.aspnetForm.DateRule.value,Question)==false)
									            {
										            alert('<%=vPrompts[44]%>' + " " + Question);
										            ElementOnFocus(HLElement2Val,StrQ_type)
										            return false;
									            }
                                    }
                                 
                                 
                                if (StrQ_type=="N")
                                    {
                                        EnterVal=eval("document.aspnetForm." + HLElement2Val + ".value")
                                      //  alert("EnterVal=" + EnterVal)
                                         // alert("LowVal=" + LowVal)
                                          // alert("HighVal=" + HighVal)
                                           //******* check the number
                                         
			                                 if (checkNumber(EnterVal)==false)
									            {
									                // alert("test")
									                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[40]%>');
                                                    //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                    ElementOnFocus(HLElement2Val,StrQ_type)
                                                    return false;
									            }        
                                           LowVal= Math.round(LowVal) 
                                           HighVal= Math.round(HighVal) 

                                            if (isNaN(EnterVal)==true)
                                                {
                                                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[40]%>');
                                                    //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                    ElementOnFocus(HLElement2Val,StrQ_type)
                                                    return false;
                                                }
                                            if (EnterVal<0)
                                                {
                                                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[68]%>');
                                                    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[29].value)
                                                    ElementOnFocus(HLElement2Val,StrQ_type)
                                                    return false;
                                                }
                                            if ((LowVal!="0"))
											 {    
                                                        if ((eval(LowVal)>eval(EnterVal))&&(LowVal!=""))
						                                    {
						                                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowVal);
							                                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowVal);
							                                    ElementOnFocus(HLElement2Val,StrQ_type)
							                                    return false;
						                                    }
						                      }
						                    if ((HighVal!="0"))
											 { 
					                                    if ((eval(HighVal)<eval(EnterVal))&&(HighVal!=""))
						                                    {	
						                                         alert('<%=vPrompts[39]%>' + " " + Question + " " + '<%=vPrompts[42]%>' + " " + HighVal);		
							                                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighVal);
							                                    ElementOnFocus(HLElement2Val,StrQ_type)
							                                    return false;
						                                    }
						                     }					
                                    }//if (StrQ_type=="N")
                                 if (StrQ_type=="P")
                                    {
                                                 StrArrayPrice = HLElement2.split("-");
                                                 EleDollarName = StrArrayPrice[0].valueOf()
                                                 EleCentName = StrArrayPrice[1].valueOf()
                                                 EleDollarNameVal="ctl00$ContentPlaceHolder1$" + EleDollarName + "";
                                                 EleCentNameVal="ctl00$ContentPlaceHolder1$" + EleCentName + "";
                                                 
                                                 Ans_TypeD = EleDollarName.substring(0,7)
                                                 Ans_TypeC = EleCentName.substring(0,7)
                                                 //alert("Ans_TypeD=" + Ans_TypeD) 
                                                // alert("Ans_TypeC=" + Ans_TypeC) 
                                                 EleDollarEnterVal=eval("document.aspnetForm." + EleDollarNameVal + ".value")
                                                 EleCentEnterVal=eval("document.aspnetForm." + EleCentNameVal + ".value")
                                                 if ((Ans_TypeD=="txt_Dol"))	
			 	                                        {	
			 	                                             //alert("EleDollarName=" + EleDollarName) 
			 	                                                if (EleDollarEnterVal!="")
			 	                                                    {
			 	                                                    
			 	                                                                     if (checkNumber(EleDollarEnterVal)==false)
									                                                    {
									                                                        // alert("test")
									                                                         alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[47]%>');
                                                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                                                            ElementOnFocus(EleDollarNameVal,StrQ_type)
                                                                                            return false;
									                                                    }        
						                                                            if (isNaN(EleDollarEnterVal)==true)
							                                                            {
							                                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[47]%>');
							                                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[8].value)
							                                                                ElementOnFocus(EleDollarNameVal,StrQ_type)
							                                                                return false;
							                                                            }
						                                                            if ((EleDollarEnterVal.indexOf("."))>=0)
							                                                            {
							                                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[48]%>');
							                                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[9].value)
							                                                                ElementOnFocus(EleDollarNameVal,StrQ_type)
							                                                                return false;
							                                                            } 
							                                         }
				                                        }
				                                        
				                                if (Ans_TypeC=="txt_Cen")
					                                    {
					                                         //alert("EleCentName=" + EleCentName)
					                                            if (EleCentEnterVal!="")
			 	                                                        {
					                                            
			 	                                                                    FinalValue="";
			 	                                                                     if (checkNumber(EleCentEnterVal)==false)
									                                                    {
									                                                        // alert("test")
									                                                         alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[49]%>');
                                                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                                                            ElementOnFocus(EleCentNameVal,StrQ_type)
                                                                                            return false;
									                                                    }    
							                                                        if ((EleCentEnterVal)>99)
									                                                        {
									                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[49]%>');
									                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[10].value)
									                                                            ElementOnFocus(EleCentNameVal,StrQ_type)
									                                                            return false;
									                                                        }
							                                                        if (isNaN(EleCentEnterVal)==true)
									                                                        {
									                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[50]%>');
									                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[11].value)
									                                                            ElementOnFocus(EleCentNameVal,StrQ_type)
									                                                            return false;
									                                                        }
							                                                        if ((EleCentEnterVal.indexOf("."))>=0)
									                                                        {
									                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[51]%>');
									                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[12].value)
									                                                            ElementOnFocus(EleCentNameVal,StrQ_type)
									                                                            return false;
									                                                        }
							                                                        if ((EleCentEnterVal)<0)
									                                                        {
									                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[65]%>');
									                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[26].value)
									                                                            ElementOnFocus(EleCentNameVal,StrQ_type)
									                                                            return false;
									                                                        }
                                                                					 
						                                                                //alert("SecondValue=" + SecondValue);
						                                                                //SecondValue=Number(SecondValue)
						                                                                //alert("SecondValue=" + eval(LowValue));
						                                                                FinalValue=Trim(EleDollarEnterVal) + "." + Trim(EleCentEnterVal)

			 	                                                                           //alert("LowVal=" + LowVal);
                                                                			 	           //alert("FinalValue=" + FinalValue);
                                                                			 	          // alert("HighVal=" + HighVal);
                                                                			 	           
                                                                                   if ((eval(LowVal)>eval(FinalValue))&&(LowVal!=""))
						                                                                {
						                                                                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowVal);
							                                                                //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowVal);
							                                                                ElementOnFocus(EleDollarNameVal,StrQ_type)
							                                                                return false;
						                                                                }
					                                                                if ((eval(HighVal)<eval(FinalValue))&&(HighVal!=""))
						                                                                {	
						                                                                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighVal);		
							                                                                //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighVal);
							                                                                ElementOnFocus(EleDollarNameVal,StrQ_type)
							                                                                return false;
						                                                                }
						                                               }// if (EleDollarEnterVal=="")
                                                    														
			 	                                }//if (Ans_Type=="txt_Cen")

                                    }//end  of Type P
                                    //This is for Feet and inche.
                                    if (StrQ_type=="M")
                                    {
                                                         StrArrayMeasure = HLElement2.split("-");
                                                         EleFeetName = StrArrayMeasure[0].valueOf()
                                                         EleIncheName = StrArrayMeasure[1].valueOf()
                                                         EleFeetNameVal="ctl00$ContentPlaceHolder1$" + EleFeetName + "";
                                                         EleIncheNameVal="ctl00$ContentPlaceHolder1$" + EleIncheName + "";
                                                           
                                                         Ans_TypeF = EleFeetName.substring(0,7)
                                                         Ans_TypeI = EleIncheName.substring(0,7)
                                                         EleFeetEnterVal=eval("document.aspnetForm." + EleFeetNameVal + ".value")
                                                         EleIncheEnterVal=eval("document.aspnetForm." + EleIncheNameVal + ".value")
                                                  
									                    if (Ans_TypeF=="txt_Fee")
										                    {
                    												 if (EleFeetEnterVal!="")
			 	                                                        {	
													                            if (isNaN(EleFeetEnterVal)==true)
														                            {
														                                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[65]%>');
														                                 //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[13].value)
														                                 ElementOnFocus(EleFeetNameVal,StrQ_type)
														                                 return false;
														                            }
													                            if ((EleFeetEnterVal.indexOf("."))>=0)
														                            {
														                                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[53]%>');
														                                 //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[14].value)
														                                 ElementOnFocus(EleFeetNameVal,StrQ_type)
														                                 return false;
														                            }
											                                        FirstValue=EleFeetEnterVal
											                                        FirstValue=Number(FirstValue)
											                                        //alert("FirstValue=" + FirstValue);
											                              }
										                    }
									                    if (Ans_TypeI=="txt_Inc")
										                    {
										                    
										                            if (EleIncheEnterVal!="")
			 	                                                        {	
												                                            MeasurementValue=document.aspnetForm.MeasurementValue.value 
												                                            MeasurementValue=MeasurementValue-1
												                                            //alert("MeasurementValue=" + MeasurementValue);
												                                            //alert("textBoxValue=" + textBoxValue);
												                                            MeasurementValue=Number(MeasurementValue)
												                                            if ((EleIncheEnterVal)>MeasurementValue)
														                                            {
														                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[15].value)
														                                                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[54]%>');
														                                                ElementOnFocus(EleIncheNameVal,StrQ_type)
														                                                return false;
														                                            }
												                                            if ((EleIncheEnterVal)<0)
														                                            {
														                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[55]%>');
														                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[16].value)
														                                                ElementOnFocus(EleIncheNameVal,StrQ_type)
														                                                return false;
														                                            }
												                                            if (isNaN(EleIncheEnterVal)==true)
														                                            {
														                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[56]%>');
														                                                //alert(document.aspnetForm.error_msg[0].value + "" + Question + ", " + document.aspnetForm.error_msg[17].value)
														                                                ElementOnFocus(EleIncheNameVal,StrQ_type)
														                                                return false;
														                                            }
												                                            if ((EleIncheEnterVal.indexOf("."))>=0)
														                                            {
														                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[57]%>');
														                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[18].value)
														                                                ElementOnFocus(EleIncheNameVal,StrQ_type)
														                                                return false;
														                                            }
											                                            SecondValue=EleIncheEnterVal
											                                            SecondValue=Number(SecondValue)
											                                            //alert("SecondValue=" + SecondValue);
											                                            MeasurementValue=MeasurementValue+1
											                                            //alert("MeasurementValue=" + MeasurementValue);
											                                            SecondValue=SecondValue/Number(MeasurementValue)	
											                                            //alert("DivSecondValue=" + SecondValue);
											                                             //alert("LowVal=" + LowVal);
											                                            SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
											                                            //SecondValue=(SecondValue/ 100);
											                                          // alert("SecondValue=" + SecondValue);
											                                           // SecondValue=Math.round((SecondValue));
											                                            // alert("SecondValue=" + SecondValue);
											                                            
												                                           Pos=LowVal.indexOf(".")
																			                if (Pos>0)
																			                {
																			                    LowValueFeet=LowVal.substring(0, Pos);
																			                    //alert("LowValueFeet=" + LowValueFeet); 
																			                    Pos2=length.LowVal
																			                    LowValueInc=LowVal.substring(Pos, Pos2);
																			                    LowValueInc=LowValueInc*Number(MeasurementValue)
																			                    //alert("LowValueMin=" + LowValueMin);
																			                    LowValueInc=Math.round(LowValueInc,2)
																			                 }
																			                 else
																			                 {
																			                    LowValueFeet=LowVal
																			                    LowValueInc=0
																			                 }
																			                LowValue=LowValueFeet + "." + LowValueInc
																			                //alert("LowValue=" + LowValue);  
                																			
																			                Pos=HighVal.indexOf(".")
																			               // alert("Pos=" + Pos);
																			                if (Pos>0)
																			                {
																			                        HighValueFeet=HighVal.substring(0, Pos);
																			                       // alert("HighValueFeet=" + HighValueFeet);
																			                        Pos2=length.HighVal
																			                        HighValueInc=HighVal.substring(Pos, Pos2);
																			                        HighValueInc=HighValueInc*Number(MeasurementValue)
																			                        // alert("HighValueMin=" + HighValueMin);
																			                        HighValueInc=Math.round(HighValueInc,2)
																			                 }
																			                 else
																			                 {
																			                    HighValueFeet=HighVal
																			                    HighValueInc=0   
                					                                                         }  
                					                                                          HighValue=HighValueFeet + "." + HighValueInc
																			                 // alert("HighValue=" + HighValue);
																		                   if (SecondValue!=0)
																		                    {      
                                                                                             SecondValue=SecondValue.substring(2,6);
                                                                                            }
                                                                                            //alert("SecondValue=" + SecondValue); 
                                                                                            
                                                                                           if (SecondValue==0)
												                                            {
													                                            FinalValue=FirstValue + "." + 0
												                                            }
											                                                else
												                                            {
													                                            FinalValue=FirstValue + "." + SecondValue
												                                            }
												                                            

											                                            // alert("IncheFinalValue=" + FinalValue);
											                                             //alert("LowVal=" + LowVal);
													                                            if (FinalValue!="")
														                                            {
																	                                           
                                            																	 if ((LowVal!="0"))
																							                            { 
																												             if ((eval(LowVal)>eval(FinalValue))&&(LowVal!=""))
																		                                                        {
            																		                                                
																			                                                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValueFeet + " " + '<%=vPrompts[33]%>' + " and " + LowValueInc + " " + '<%=vPrompts[34]%>' + ".");		
                                            																			            //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValueFeet + " feet(s) and " + LowValueInc + " Inche(s).");
                                            																			            ElementOnFocus(EleFeetNameVal,StrQ_type)
																			                                                        return false;
																		                                                        }
																		                                                }
																		                                            if ((HighVal!="0"))
																							                            {       
																	                                                        if ((eval(HighVal)<eval(FinalValue))&&(HighVal!=""))
																		                                                        {
																		                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValueFeet + " " + '<%=vPrompts[33]%>' + " and " + HighValueInc + " " + '<%=vPrompts[34]%>' + ".");		
                                            																                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValueFeet + " feet(s) and " + HighValueInc + " Inche(s).");
                                            																                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValue);					
                                            																			            ElementOnFocus(EleFeetNameVal,StrQ_type)
																			                                                        return false;
																		                                                        }
																														}						
                        																                    
															                                          }//if (FinalValue!="")
                    											                }//if (EleFeetEnterVal!="")
                    														
										                    }//end of inches if statement	
										 }//end of type M
										 if (StrQ_type=="H")
										 {
										                            StrArrayHour = HLElement2.split("-");
                                                                    EleHourName = StrArrayHour[0].valueOf()
                                                                    EleMinuteName = StrArrayHour[1].valueOf()

                                                                    Ans_TypeH = EleHourName.substring(0,7)
                                                                    Ans_TypeM = EleMinuteName.substring(0,7)
                                                                    EleHourNameVal="ctl00$ContentPlaceHolder1$" + EleHourName + "";
                                                                    EleMinuteNameVal="ctl00$ContentPlaceHolder1$" + EleMinuteName + "";
                                                                      
                                                                    EleHourEnterVal=eval("document.aspnetForm." + EleHourNameVal + ".value")
                                                                    EleMinuteEnterVal=eval("document.aspnetForm." + EleMinuteNameVal + ".value")
										                           
										                          // alert("EleHourEnterVal=" + EleHourEnterVal);
										                           //alert("EleMinuteEnterVal=" + EleMinuteEnterVal);
										                          //alert("LowVal=" + LowVal);
										                          //alert("HighVal=" + HighVal);
										                           
										                if (Ans_TypeH=="txt_Hou")
														    {
																			
																		 if (EleHourEnterVal!="")
			 	                                                         {			
																					if (isNaN(EleHourEnterVal)==true)
																						{
																						    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[19].value)
																						      alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[58]%>');
																						     ElementOnFocus(EleHourNameVal,StrQ_type)
																						    return false;
																						}
																					if ((EleHourEnterVal.indexOf("."))>=0)
																						{
																						    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[20].value)
																						    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[59]%>');
																						    ElementOnFocus(EleHourNameVal,StrQ_type)
																						    return false;
																						}
																			            FirstValue=EleHourEnterVal
																			            FirstValue=Number(FirstValue)
																			            //alert("FirstValue=" + FirstValue);
																		}
														   }
														if (Ans_TypeM=="txt_Min")
														   {
														   
														                 if (EleMinuteEnterVal!="")
			 	                                                         {	
			 	                                                         
																				                if ((EleMinuteEnterVal)>59)
																						                {
																						                 //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[21].value)
																						                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[60]%>');
																						                 ElementOnFocus(EleMinuteNameVal,StrQ_type)
																						                 return false;
																						                }
																				                if ((EleMinuteEnterVal)<0)
																						                {
																						                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[61]%>');
																						                 //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[22].value)
																						                 ElementOnFocus(EleMinuteNameVal,StrQ_type)
																						                 return false;
																						                }
																				                if (isNaN(EleMinuteEnterVal)==true)
																						                {
																						                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[62]%>');
																						                    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[23].value)
																						                    ElementOnFocus(EleMinuteNameVal,StrQ_type)
																						                    return false;
																						                }
																				                if ((EleMinuteEnterVal.indexOf("."))>=0)
																						                {
																						                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[63]%>');
																						                    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[24].value)
																						                    ElementOnFocus(EleMinuteNameVal,StrQ_type)
																						                    return false;
																						                }
																			                SecondValue=EleMinuteEnterVal
																			                SecondValue=Number(SecondValue)
																			                 SecondValue=SecondValue/60
																			                // alert("SecondValue=" + SecondValue);
																			                 SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
																			                 //alert("SecondValue=" + SecondValue);
																			                
																			                Pos=LowVal.indexOf(".")
																			                if (Pos>0)
																			                {
																			                    LowValueHour=LowVal.substring(0, Pos);
																			                    //alert("LowValueHour=" + LowValueHour); 
																			                    Pos2=length.LowVal
																			                    LowValueMin=LowVal.substring(Pos, Pos2);
																			                    LowValueMin=LowValueMin*60
																			                    //alert("LowValueMin=" + LowValueMin);
																			                    LowValueMin=Math.round(LowValueMin,2)
																			                 }
																			                 else
																			                 {
																			                    LowValueHour=LowVal
																			                    LowValueMin=0
																			                 }
																			                LowValue=LowValueHour + "." + LowValueMin
																			                //alert("LowValue=" + LowValue);  
                																			
																			                Pos=HighVal.indexOf(".")
																			               // alert("Pos=" + Pos);
																			                if (Pos>0)
																			                {
																			                        HighValueHour=HighVal.substring(0, Pos);
																			                       // alert("HighValueHour=" + HighValueHour);
																			                        Pos2=length.HighVal
																			                        HighValueMin=HighVal.substring(Pos, Pos2);
																			                        HighValueMin=HighValueMin*60
																			                        // alert("HighValueMin=" + HighValueMin);
																			                        HighValueMin=Math.round(HighValueMin,2)
																			                 }
																			                 else
																			                 {
																			                    HighValueHour=HighVal
																			                    HighValueMin=0   
                					                                                         }  
                					                                                          HighValue=HighValueHour + "." + HighValueMin
																			                //alert("HighValue=" + HighValue);
																		                   if (SecondValue!=0)
																		                    {      
                                                                                             SecondValue=SecondValue.substring(2,6);
                                                                                            }
                                                                                            //alert("SecondValue=" + SecondValue); 
                                                                                            
                                                                                           if (SecondValue==0)
												                                            {
													                                            FinalValue=FirstValue + "." + 0
												                                            }
											                                                else
												                                            {
													                                            FinalValue=FirstValue + "." + SecondValue
												                                            }
												                                            
                                                                                          
																			               if  (FinalValue!="")  
																									{
																									    
																									                if ((LowVal!="0"))
																							                            { 
																												             if ((eval(LowVal)>eval(FinalValue))&&(LowVal!=""))
																		                                                        {
            																		                                                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValueHour + " hour(s) and " + LowValueMin + " minute(s).");	
																			                                                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValue);
                                            																			            //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValueHour + " hour(s) and " + LowValueMin + " minute(s).");
                                            																			            ElementOnFocus(EleHourNameVal,StrQ_type)
																			                                                        return false;
																		                                                        }
																		                                                }
																		                                            if ((HighVal!="0"))
																							                            {       
																	                                                        if ((eval(HighVal)<eval(FinalValue))&&(HighVal!=""))
																		                                                        {
																		                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValueHour + " hour(s) and " + HighValueMin + " minute(s).");	
                                            																                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValueHour + " hour(s) and " + HighValueMin + " minute(s).");
                                            																                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValue);					
                                            																			            ElementOnFocus(EleHourNameVal,StrQ_type)
																			                                                        return false;
																		                                                        }
																														}								
																																				 
																									 }//if (FinalValue!="")
																					              
																							                
																			          }//if (EleMinuteEnterVal!="")
																						
																 } //if (Ans_TypeM=="txt_Min")
										 }//End of type H
																															      
                        } //  if (StrQ_type=="N" || StrQ_type=="D" || StrQ_type=="P" || StrQ_type=="H" || StrQ_type=="M")   
		     }//if (StrCheckQuestion==StrHLQ_no)
		
        //alert("StartArray=" + StartArray);
        //alert("Question=" + Question)	
        //alert("HighVal=" + HighVal)	
        //alert("LowVal=" + LowVal)	
      return true;
        
       
}
function QuestionStatus(Question,ArrayAList,StartArray)
{
		// alert("QuestionStatus");
		 //alert("StartArray=" + StartArray);
		Selected_Q_no=Number(Question)
		//alert("Selected_Q_no=" + Selected_Q_no);
		ArrayAllQuestionsElement=document.aspnetForm.ArrayAllQuestionsElement.value
		// alert("ArrayAllQuestionsElement=" + ArrayAllQuestionsElement);
		
			//alert("AnswerStr=" + AnswerStr)
								StrArrayLen = ArrayAllQuestionsElement.split("|");
								//AllArraylength = StrArrayLen.length
								//alert("AllArraylength=" + AllArraylength) 
								ArrayCount=eval(StartArray)
								//alert("ArrayCount=" + ArrayCount) 
	
							
									QuestionElement = StrArrayLen[ArrayCount].valueOf()
									StrQuestion_no = QuestionElement.substring(0,3)
									 // alert("StrQuestion_no=" + StrQuestion_no)
									Loopquestion_no=Number(StrQuestion_no)
								
									// alert("Selected_Q_no=" + Selected_Q_no)
									//alert("Loopquestion_no=" + Loopquestion_no)
									if (Selected_Q_no==Loopquestion_no)
										{
										// alert("ArrayCount=" + ArrayCount)
														if (ArrayCount!=0)
														{
															LastQuestion= StrArrayLen[ArrayCount-1].valueOf()
															Strloop_no = LastQuestion.substring(0,3)
															//alert("LastQuestion=" + LastQuestion)	
															loopQ_type=LastQuestion.substring(4,5)
															
															//alert("ArrayAList=" + ArrayAList)
															//****check the last question if it is answered
															 
															if (QuestionResponse(loopQ_type,Strloop_no,ArrayAList,ArrayCount)==false)
																	{
																	
																		 //alert("return falsedsddsd")
																		return false;
																	}
														
															
															 
															}
										
									
										}
		
		return true;
}

function QuestionResponse(Question_type,Question_no,StrAllElements,ArrayCount)
{
			
							   // alert("Question_typesssss=" + Question_type)
							   // alert("Question_nosssss=" + Question_no)
							   //  alert("StrAllElementsssss=" + StrAllElements)
							    // alert("ArrayCount=" + ArrayCount) ctl00$ContentPlaceHolder1$
							        
								 SplitArrayLen = StrAllElements.split("|");
								//return false
									
									
								SplitArrayElement = SplitArrayLen[ArrayCount-1].valueOf()
								SplitArrayElementVal="ctl00$ContentPlaceHolder1$" + SplitArrayElement + "";
								//alert("SplitArrayElementVal=" + SplitArrayElementVal)
								POSLen=SplitArrayElement.length
								SplitArrayQuestion_no = SplitArrayElement.substring(7,POSLen)
								
								//alert("Question_type=" + Question_type)
								FPOS=SplitArrayElement.indexOf("-")
								if (FPOS>0)
								{ 
									 FBoxArrayLen = SplitArrayElement.split("-");
									 FBoxEleName0= FBoxArrayLen[0].valueOf()
									 FBoxEleQ_type0=Question_type
								}
								else
								{
									FBoxEleQ_type0=Question_type
									FBoxEleName0=SplitArrayElement
								}
								FBoxEleName0="ctl00$ContentPlaceHolder1$" + FBoxEleName0 +"";
								 //alert("FBoxEleQ_type0=" + FBoxEleQ_type0)
								 //alert("FBoxEleName0=" + FBoxEleName0)
								 
								QuestionElement2 = SplitArrayLen[ArrayCount].valueOf()
								Question_type2=QuestionElement2.substring(0,7)
								
								QuestionElement2Val="ctl00$ContentPlaceHolder1$" + QuestionElement2 +"";
								 
								//alert("QuestionElement2=" + QuestionElement2)
								//alert("Question_type2=" + Question_type2)
								POS=QuestionElement2.indexOf("-")
								//alert("POS=" + POS)
								MultiBoxFlag=""
								if (POS>0)
								{
									 MultiBoxFlag="1"
									 BoxArrayLen = QuestionElement2.split("-");
									 BoxEleName0= BoxArrayLen[0].valueOf()
									 BoxEleQ_type0=BoxEleName0.substring(0,7)
									 BoxEleName1= BoxArrayLen[1].valueOf()
									 BoxEleQ_type1=BoxEleName1.substring(0,7)
									 //alert("BoxEleName0=" + BoxEleName0)
								     //alert("BoxEleQ_type0=" + BoxEleQ_type0)
								      //alert("BoxEleName1=" + BoxEleName1)
								     //alert("BoxEleQ_type1=" + BoxEleQ_type1)
								       
									 BoxEleName0="ctl00$ContentPlaceHolder1$" + BoxEleName0 +"";
									 BoxEleName1="ctl00$ContentPlaceHolder1$" + BoxEleName1 +"";
									  //alert("BoxEleName0=" + BoxEleName0)
								        //alert("BoxEleQ_type0=" + BoxEleQ_type0)
								      //alert("BoxEleName1=" + BoxEleName1)
								      //alert("BoxEleQ_type1=" + BoxEleQ_type1)
								}
								//QuestionEnabled(BoxEleName0,BoxEleQ_type0)
								//QuestionEnabled(BoxEleName1,BoxEleQ_type1)
								//ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
								 
								switch(Question_type)
										{
						 				case "C" :		
						 				
						 									Flag=""			
															k=eval("document.aspnetForm." + SplitArrayElementVal + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (b=0; b<k; b++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + "[b].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + "[b].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																														}
																											}
																										else
																											{
																													Flag="0"
																											}		
			
																							}		
																				}
																		
																}
																//alert("Flag=" + Flag)
															if (Flag=="1")
																{
																		//alert("Please answer " + Q_no)
																		//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																		 alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																		if (MultiBoxFlag=="1")
																			{
																				 QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																				 QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																				 ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																			}
																		else
																			{
																				QuestionEnabled(QuestionElement2Val,Question_type2)
																				ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
												
																			}
																		return false;
																}
															
											break
										case "L" :	
															
															Flag=""			
															k=eval("document.aspnetForm." + SplitArrayElementVal + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
																	//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (b=0; b<k; b++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + "[b].disabled")
																						//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + "[b].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																														}
																											}
																										else
																											{
																													Flag="0"
																											}		
			
																							}		
																				}
																		
																}
														//alert("Flag1=" + Flag)
															if (Flag=="1")
																{
																		//alert("Please answer " + Q_no)
																		 alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																		//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																		
																		if (MultiBoxFlag=="1")
																			{
																				 QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																				 QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																				 ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																			}
																		else
																			{
																				QuestionEnabled(QuestionElement2Val,Question_type2)
																				ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																			}
																		return false;
																}
											break
									    case "R" :
															Flag=""			
															k=eval("document.aspnetForm." + SplitArrayElementVal + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (b=0; b<k; b++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + SplitArrayElementVal + "[b].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + SplitArrayElementVal + "[b].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																														}
																											}
																										else
																											{
																													Flag="0"
																											}		
			
																							}		
																				}
																		
																}
																//alert("Flag=" + Flag)
															if (Flag=="1")
																{
																        alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																		//alert("Please answer " + Q_no)
																		//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																		if (MultiBoxFlag=="1")
																			{
																				 QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																				 QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																				 ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																			}
																		else
																			{
																				QuestionEnabled(QuestionElement2Val,Question_type2)
																				ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																			}
																		return false;
																}
											break
										case "T" :
										
													Q_CheckDisable_T=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
														 //alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_T==false)
														{	
																		textBoxValue_T=eval("document.aspnetForm." + SplitArrayElementVal + ".value")
																		//textBoxValue_T=Trim(textBoxValue_T)
																		
																		if (textBoxValue_T=="")
																			{
																				 //alert("Please answerewew " + Q_no)
																				alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																				//alert("BoxEleName0=" + BoxEleName0)
																				//alert("BoxEleQ_type0=" + BoxEleQ_type0)
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
														}//ending of disable		
											break
										case "D" :
										
													Q_CheckDisable_D=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_D==false)
														{	
																		textBoxValue_D=eval("document.aspnetForm." + SplitArrayElementVal + ".value")
																		textBoxValue_D=Trim(textBoxValue_D)
																		
																		if (textBoxValue_D=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
														}//ending of disable		
										
											
											break
										case "N" :
											//alert("N")
													Q_CheckDisable_N=eval("document.aspnetForm." + SplitArrayElementVal + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_N==false)
														{	
																		textBoxValue_N=eval("document.aspnetForm." + SplitArrayElementVal + ".value")
																		textBoxValue_N=Trim(textBoxValue_N)
																	
																		if (textBoxValue_N=="")
																			{
																			    alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				//alert("Please answer " + Q_no)
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
																		
														}//ending of disable	
							
											break
										case "P" :
										
													 //alert("SplitArrayElement=" + SplitArrayElement) 
													    PriceArrayLen = SplitArrayElement.split("-");
														//return false
					
														DollarArrayElement = PriceArrayLen[0].valueOf()
														DollarArrayElementVal="ctl00$ContentPlaceHolder1$" + DollarArrayElement + "";
														// alert("DollarArrayElement=" + DollarArrayElement)
														CentArrayElement = PriceArrayLen[1].valueOf()
														CentArrayElementVal="ctl00$ContentPlaceHolder1$" + CentArrayElement + "";
														 //alert("CentArrayElement=" + CentArrayElement)
														//ctl00$ContentPlaceHolder1$
													Q_CheckDisable_P=eval("document.aspnetForm." + DollarArrayElementVal + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_P==false)
														{	
																		textBoxValue_Dollar=eval("document.aspnetForm." + DollarArrayElementVal + ".value")
																		textBoxValue_Dollar=Trim(textBoxValue_Dollar)
																	    textBoxValue_cent=eval("document.aspnetForm." + CentArrayElementVal + ".value")
																		textBoxValue_cent=Trim(textBoxValue_cent)
																		//alert("textBoxValue_cent=" + textBoxValue_cent)
																		
																		if (textBoxValue_Dollar==""||textBoxValue_cent=="")
																			{
																			    alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				//alert("Please answer " + Q_no)
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
														}//ending of disable	
					
											break
										case "M" :
													    //alert("SplitArrayElement=" + SplitArrayElement) 
													    MeasureArrayLen = SplitArrayElement.split("-");
														//return false
					
														 FeetArrayElement = MeasureArrayLen[0].valueOf()
														 
														IncArrayElement = MeasureArrayLen[1].valueOf()
														 //alert("FeetArrayElement=" + FeetArrayElement)
														 //alert("IncArrayElement=" + IncArrayElement)
								                        FeetArrayElementVal="ctl00$ContentPlaceHolder1$" + FeetArrayElement + "";
								                        IncArrayElementVal="ctl00$ContentPlaceHolder1$" + IncArrayElement + "";
													 
													Q_CheckDisable_M=eval("document.aspnetForm." + FeetArrayElementVal + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_M==false)
														{	
																		textBoxValue_feet =eval("document.aspnetForm." + FeetArrayElementVal + ".value")
																		textBoxValue_feet=Trim(textBoxValue_feet)
																	    textBoxValue_M=eval("document.aspnetForm." + IncArrayElementVal + ".value")
																		textBoxValue_M =Trim(textBoxValue_M)
																		//alert("textBoxValue_feet=" + textBoxValue_feet)
																		
																		if (textBoxValue_M==""||textBoxValue_feet=="")
																			{
																			    alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				//alert("Please answer " + Q_no)
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
														}//ending of disable	
															
											break
										case "H" :
													//alert("SplitArrayElement=" + SplitArrayElement) 
													 HourArrayLen = SplitArrayElement.split("-");
														//return false
					
													   HourArrayElement = HourArrayLen[0].valueOf()
													   //alert("HourArrayElement=" + HourArrayElement)
													   MinArrayElement = HourArrayLen[1].valueOf()
													   //alert("MinArrayElement=" + MinArrayElement)
													   HourArrayElementVal="ctl00$ContentPlaceHolder1$" + HourArrayElement + "";
								                       MinArrayElementVal="ctl00$ContentPlaceHolder1$" + MinArrayElement + "";
								
													Q_CheckDisable_H=eval("document.aspnetForm." + HourArrayElementVal + ".disabled")
														//alert("Q_CheckDisable_H=" + Q_CheckDisable_H)	
												
														
													if (Q_CheckDisable_H==false)
														{	
																		textBoxValue_H=eval("document.aspnetForm." + HourArrayElementVal + ".value")
																		textBoxValue_H=Trim(textBoxValue_H)
																		//alert("textBoxValue_H=" + textBoxValue_H)
																		textBoxValue_Min=eval("document.aspnetForm." + MinArrayElementVal + ".value")
																		textBoxValue_Min=Trim(textBoxValue_Min)
																		//alert("textBoxValue_Min=" + textBoxValue_Min)
																		
																		if (textBoxValue_H==""||textBoxValue_Min=="")
																			{
																				//alert("Please answer " + Q_no)
																				//alert("" + document.aspnetForm.error_msg[4].value + " " + Question_no + "")
																			     alert('<%=vPrompts[43]%>' + " " + Question_no + "");
																				 //alert("BoxEleName0WWW=" + BoxEleName0)
																				  //alert("BoxEleName1WWW=" + BoxEleName1)
																				if (MultiBoxFlag=="1")
																						{
																							QuestionEnabled(BoxEleName0,BoxEleQ_type0)
																							QuestionEnabled(BoxEleName1,BoxEleQ_type1)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																					else
																						{
																							QuestionEnabled(QuestionElement2Val,Question_type2)
																							ElementOnFocus(FBoxEleName0,FBoxEleQ_type0)
																						}
																				return false;
																			}
														}//ending of disable	
														
													
										
															
												
											break
										default:
											InPutValue=""
											//alert("default")
											break
										}
			return true;							 
} 
function ElementOnFocus(QuestionElement2,Question_type2)
{
			 //alert("QuestionElement2=" + QuestionElement2)
			 //alert("Question_type2=" + Question_type2)
		//TextProdNumber = document.QGrid.EnterProduct.value
			//alert("TabKey=" + event.keyCode)
			
			
				
				if (Question_type2=="N" || Question_type2=="T" || Question_type2=="D" || Question_type2=="P" || Question_type2=="H" || Question_type2=="M")
					{
						eval("document.aspnetForm." + QuestionElement2 + ".focus()");
						eval("document.aspnetForm." + QuestionElement2 + ".select()");
					}
				if (Question_type2=="R" || Question_type2=="L" || Question_type2=="C")
						{
						        k=eval("document.aspnetForm." + QuestionElement2 + ".length")
								// alert("kV=" + k)	
								 LenCheck=String(k)
										if (LenCheck=="undefined")
											{
												  eval("document.aspnetForm." + QuestionElement2 + ".focus()")
												 
											}
										else
											{
											     eval("document.aspnetForm." + QuestionElement2 + "[0].focus()");
											}		
							//alert("AnstypeTest=" + Anstype)
							//eval("document.QGrid." + ProdQNum + "[0].checked=true")
							//eval("document.aspnetForm." + QuestionElement2 + "[0].focus()");
							//eval("document.aspnetForm." + QuestionElement2 + "[0].select()");
							
						}	
	
}
//******************************************************** Before going to  next page
function CheckRTSBeforeSubmit(EachElement,Ans_Type,Question,Ele_Q_no,ArrayCount)
{
               // alert("RTS=" + EachElement)
              //alert("CheckRTSBeforeSubmitEachElement=" + EachElement)
              //alert("CheckRTSBeforeSubmitAns_Type=" + Ans_Type)
              //alert("CheckRTSBeforeSubmitQuestion=" + Question)
              //alert("CheckRTSBeforeSubmitEle_Q_no=" + Ele_Q_no)
              
                ArrayEleSubmitRTS=document.aspnetForm.ArrayEleSubmitRTS.value;
                //alert("ArrayEleSubmitRTS=" + ArrayEleSubmitRTS);
                ArraySubmitRTS_Val = ArrayEleSubmitRTS.split("|");
                ArrayElementRTS = ArraySubmitRTS_Val[ArrayCount].valueOf()
                ArrayElementRTS=ArrayElementRTS.substring(0,ArrayElementRTS.length-1);
                //alert("ArrayElementRTS=" + ArrayElementRTS)
                
			if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))	
			{	
							ArrayEachRTS_Val = ArrayElementRTS.split("-");
												
							k=eval("document.aspnetForm." + EachElement + ".length")
							 //alert("k55=" + k)	
							LenCheck=String(k)
																	
							if (LenCheck=="undefined")
									{
									     
									                     ArrayEachRTS_Val=ArrayElementRTS        
									      
									                    //alert("ArrayEachRTS_GOOD   =" + ArrayEachRTS_Val)	             
									                     EleNameRTS=ArrayEachRTS_Val.substring(0,7)
						                                 // alert("EleNameRTS=" + EleNameRTS);
						                                EleValueRTS=ArrayEachRTS_Val.substring(7,11)
						                                  // alert("EleValueRTS=" + EleValueRTS);
														tempobj=eval("document.aspnetForm." + EachElement + "")
														 textBoxValue=eval("document.aspnetForm." + EachElement + ".value")
														  //alert("textBoxValue1=" + textBoxValue)
														
														RTSIssuesCheck(Question,Ele_Q_no,EleValueRTS,tempobj,EachElement)
														//RTSIssuesCheck(Question,QuestionValue,textBoxValue,tempobj,textname)
							
								
									}					
							else
									{
									         
												for (e=0; e<k; e++)
													{
													    ArrayRTS_Val = ArrayEachRTS_Val[e].valueOf();
													  // alert("ArrayRTS_Val=" + ArrayRTS_Val)
													    EleNameRTS=ArrayRTS_Val.substring(0,7)
						                                // alert("EleNameRTS=" + EleNameRTS);
						                                EleValueRTS=ArrayRTS_Val.substring(7,11)
						                                // alert("EleValueRTS=" + EleValueRTS);
														tempobj=eval("document.aspnetForm." + EachElement + "[e]") 
														textBoxValue=eval("document.aspnetForm." + EachElement + "[e].value")
														//alert("textBoxValue=" + textBoxValue)
														RTSIssuesCheck(Question,Ele_Q_no,EleValueRTS,tempobj,EachElement)		
													}
									}
			}//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
}

function CallFormSubmit(theform)
{
        DisableButtons()
        
        document.aspnetForm.CallFormAnswers.value='';
		eval("document.aspnetForm.CheckTo_Erase_Answers.value='NO'")
		//All the elements with high and lows values
        ArrayEleSubmit=document.aspnetForm.ArrayEleSubmit.value;
        //alert("ArrayEleSubmit=" + ArrayEleSubmit);
		//Work_Type_Id=document.aspnetForm.Work_Type_Id.value
		//alert("Work_Type_Id=" + Work_Type_Id);
		//LastQnumber=document.aspnetForm.lastquestion.value
		//alert("LastQnumber=" + LastQnumber);
		All_Ele_Ans_Val=document.aspnetForm.All_EleAns_Val.value;
	 //alert("All_Ele_Ans_Val=" + All_Ele_Ans_Val);
		ArrayEleAns_Val = All_Ele_Ans_Val.split("|");
		
		
		
		
		ArrayEleList = ArrayEleSubmit.split("|");
		//alert("StrVal1=" + StrVal1);
		arraylength = ArrayEleList.length
		//alert("arraylength=" + arraylength) 
		arraylength=eval(arraylength-1)
        RequiredDatalast="";
        sumvalue30=0
	    sumvalue31=0
	    sumvalue1003=0
	    sumvalue2003=0
	    NewQuestion="001"
	    //QuestionNumber="0" 
	    Flag=1
	    DollarValuethere=""
	    QuestionHenJob=""
	    RequiredData="Y";
	    QuestionAns="";
	    D=0;
	    F=0;
	    AnswerForCallForm="";
	    StrCallFormAnswers="";
	    
				 //alert("arraylength=" + arraylength)           
			for ( s = 0; s < arraylength ; s++ )
				{
				        F=0;
				         
				        StatusFlag=false;
				        EachElementSubmit = ArrayEleList[s].valueOf()
				        //alert("EachElementSubmit=" + EachElementSubmit)  
				        ArrayQHL= EachElementSubmit.split("-");
				        textname= ArrayQHL[0].valueOf()
				        HighValue= ArrayQHL[1].valueOf()
				        LowValue= ArrayQHL[2].valueOf()
				       // alert("HighValue=" + HighValue)  
                       // alert("LowValue=" + LowValue)  
                        //alert("D=" + D) 
                        EachElementAns_Val = ArrayEleAns_Val[D].valueOf()
                        //alert("EachElementAns_ValOut=" + EachElementAns_Val)  

				        //Element object ctl00$ContentPlaceHolder1$rad_qno002
				        
				        EachElementobj="ctl00$ContentPlaceHolder1$" + textname + "";
				         //alert("EachElementobj=" + EachElementobj) 
				       // eval("document.aspnetForm." + EachElement + ".length")
				       
				         EleName=textname.substring(0,7)
						// alert("EleName=" + EleName);
						 Question=textname.substring(7,10)


                            	//************* RTS ISSUE
					
					        
								
						QuestionValue=Number(Question)
						if (QuestionValue>=1)
							{	
									//alert("QuestionP=" + Question);
									//alert("NameP=" + Name);
									//alert("textnameP=" + textname);
									//alert("textBoxValueP=" + textBoxValue);EachElement,Ans_Type,Question,Ele_Q_no,StrRTS
								CheckRTSBeforeSubmit(EachElementobj,EleName,Question,Question,s)
							}
						Here_RTS_Issue=document.aspnetForm.Here_RTS_Issue.value
						//alert("Here_RTS_Issue=" + Here_RTS_Issue) 
						Here_RTS_Issue="N";
						if (Here_RTS_Issue=="Y")
						{	
									document.aspnetForm.Here_RTS_Issue.value=''
									RTS_Merch_Access=document.aspnetForm.Str_Merch_no.value 
							       // alert("RTS_Merch_Access=" + RTS_Merch_Access);	
									RTS_Merch_Access=Trim(RTS_Merch_Access)			
									RTS_Saving_Answers()
									ILang_Id=document.aspnetForm.ILang_Id.value
				                   //alert("ILang_Id=" + ILang_Id) 
				                   
		                        
							         //document.aspnetForm.action="http://dev2k3.sparinc.com/itsnet/its_IssueAddNext.aspx"
						             //document.aspnetForm.action="http://mi23.sparinc.com/its/its_issueaddnext.asp"
							        //document.aspnetForm.action="http://mitest.sparinc.com/its/its_issueaddnext.asp"
							         //document.aspnetForm.action="http://mi23.sparinc.com/itsnet/its_IssueAddNext.aspx"
							          RTS_Url=document.aspnetForm.RTS_Url.value
		                             document.aspnetForm.action=RTS_Url; 
							         document.aspnetForm.submit();
							         return false;
								
						}
                       // return false;	
				        //Check for text box
	                       if ((EleName=="txt_num")||(EleName=="txt_dat")||(EleName=="txt_txt")||(EleName=="txt_Dol")||(EleName=="txt_Cen")||(EleName=="txt_Fee")||(EleName=="txt_Inc")||(EleName=="txt_Hou")||(EleName=="txt_Min"))
							{
					                        
					                        Eledisabled=eval("document.aspnetForm." + EachElementobj + ".disabled")
					                        if (Eledisabled==false)
							                   {
							                   
							                                if ((EleName=="txt_Dol")||(EleName=="txt_Cen")||(EleName=="txt_Fee")||(EleName=="txt_Inc")||(EleName=="txt_Hou")||(EleName=="txt_Min"))
																{
																        
																
									                                              QuestionAns=eval("document.aspnetForm." + EachElementobj + ".value")
                                                                                    //alert("QuestionResponse=" + QuestionResponse) 
                                                                                  QuestionAns=Trim(QuestionAns)
                                                                                  
                                                                                    if (QuestionAns=="") 
																                    {
																	                    //alert(document.test.error_msg[7].value + " " + Question)
																	                    alert('<%=vPrompts[46]%>' + " " + Question)
																	                    //alert("here") 
																	                    AbleButtons()
																	                    return false;
															                        }  
                                                                                  if (QuestionAns!="")
                                                                                    {
                                                                                           
					                                                                        StatusFlag=true;
					                                                                                                    //alert("EleName=" + EleName);
					                                                                                            //************************ Dollar
					                                                                                                    if (EleName=="txt_Dol")
																										                    {
																										                         
																												                    DollarValuethere=""
																													                    if (isNaN(QuestionAns)==true)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[8].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[47]%>');
																														                        AbleButtons()
																														                        return false;
																														                    }
																													                    if ((QuestionAns.indexOf("."))>=0)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[9].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[48]%>');
																														                        AbleButtons()
																														                        return false;
																														                    }
																											                    FirstValue=QuestionAns
																											                    //alert("FirstValue=" + FirstValue);
																											                    FirstValue=Number(FirstValue)
																											                    //alert("FirstValue=" + FirstValue);
																											                    DollarValuethere="YES"
																											                    
																										                    }
																									                    if (EleName=="txt_Cen")
																										                    {
                    																											
                    																										
																												                    if ((QuestionAns)>99)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[10].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[49]%>');
																														                        AbleButtons()
																														                        return false;
																														                    }
																												                    if (isNaN(QuestionAns)==true)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[11].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[50]%>');
																														                        AbleButtons()  
																														                        return false;
																														                    }
																												                    if ((QuestionAns.indexOf("."))>=0)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[12].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[51]%>');
																														                        AbleButtons()
																														                        return false;
																														                    }
																												                    if ((QuestionAns)<0)
																														                    {
																														                        //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[26].value)
																														                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[65]%>');
																														                        AbleButtons()
																														                        return false;
																														                    }
																											                    SecondValue=QuestionAns
																											                    //alert("SecondValue=" + SecondValue);
																											                    //SecondValue=Number(SecondValue)
																											                    //alert("SecondValue=" + eval(LowValue));
																											                    FinalValue=FirstValue + "." + SecondValue
																											                    //alert("FinalValue001=" + FinalValue);		
																													                    if (FinalValue!="")
																														                    {
																																	                    if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
																																		                    {
																																			                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValue);
																																			                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValue );
																																			                    AbleButtons()
																																			                    return false;
																																		                    }
																																	                    if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
																																		                    {			
																																			                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValue);
																																			                    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValue );
																																			                    AbleButtons()
																																			                    return false;
																																		                    }
                    																																		
																																                    FirstValue=""
																																                    SecondValue=""
																																                    FinalValue=""
																																                    DollarValuethere=""
																																                    AnswerForCallForm=AnswerForCallForm + "P-NO|";
																															                  }
                    																														
																										                    }	//End of Dollar and cent
                    																										
                    					                                                                         //************************ Feet
                    					                                                                                    //This is for Feet and inche.
																															if (EleName=="txt_Fee")
																																{
																																			
																																			if (isNaN(QuestionAns)==true)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[13].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[52]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																			if ((QuestionAns.indexOf("."))>=0)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[14].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[53]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																	FirstValue=QuestionAns
																																	FirstValue=Number(FirstValue)
																																	//alert("FirstValue=" + FirstValue);
																																}
																															if (EleName=="txt_Inc")
																																{
																																		        MeasurementValue=document.aspnetForm.MeasurementValue.value 
																																		        //alert("MeasurementValue=" + MeasurementValue);
																																		        //alert("textBoxValue=" + textBoxValue);
																																		        MeasurementValue=MeasurementValue-1
																																		        MeasurementValue=Number(MeasurementValue)
																																		        if ((QuestionAns)>MeasurementValue)
																																				        {
																																				            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[15].value)
																																				            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[54]%>');
																																				            AbleButtons()
																																				            return false;
																																				        }
																																		        if ((QuestionAns)<0)
																																				        {
																																				            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[16].value)
																																				            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[55]%>');
																																				            AbleButtons()
																																				            return false;
																																				        }
																																		        if (isNaN(QuestionAns)==true)
																																				        {
																																				            //alert(document.aspnetForm.error_msg[0].value + "" + Question + ", " + document.aspnetForm.error_msg[17].value)
																																				            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[56]%>');
																																				            AbleButtons()
																																				            return false;
																																				        }
																																		        if ((QuestionAns.indexOf("."))>=0)
																																				        {
																																				            //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[18].value)
																																				            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[57]%>');
																																				            AbleButtons()
																																				            return false;
																																				        }
																																	        SecondValue=QuestionAns
																																 
											                                                                                                SecondValue=Number(SecondValue)
											                                                                                                //alert("SecondValue=" + SecondValue);
											                                                                                                MeasurementValue=MeasurementValue+1
											                                                                                                //alert("MeasurementValue=" + MeasurementValue);
											                                                                                                SecondValue=SecondValue/Number(MeasurementValue)	
											                                                                                                //alert("DivSecondValue=" + SecondValue);
											                                                                                                 //alert("LowVal=" + LowVal);
											                                                                                                SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
											                                                                                                //SecondValue=(SecondValue/ 100);
											                                                                                              // alert("SecondValue=" + SecondValue);
											                                                                                               // SecondValue=Math.round((SecondValue));
											                                                                                                // alert("SecondValue=" + SecondValue);
                                            											                                            
												                                                                                               Pos=LowValue.indexOf(".")
																			                                                                    if (Pos>0)
																			                                                                    {
																			                                                                        LowValueFeet=LowValue.substring(0, Pos);
																			                                                                        //alert("LowValueFeet=" + LowValueFeet); 
																			                                                                        Pos2=length.LowValue
																			                                                                        LowValueInc=LowValue.substring(Pos, Pos2);
																			                                                                        LowValueInc=LowValueInc*Number(MeasurementValue)
																			                                                                        //alert("LowValueMin=" + LowValueMin);
																			                                                                        LowValueInc=Math.round(LowValueInc,2)
																			                                                                     }
																			                                                                     else
																			                                                                     {
																			                                                                        LowValueFeet=LowValue
																			                                                                        LowValueInc=0
																			                                                                     }
																			                                                                    //LowValue=LowValueFeet + "." + LowValueInc
																			                                                                    //alert("LowValue=" + LowValue);  
                                                            																			
																			                                                                    Pos=HighValue.indexOf(".")
																			                                                                   // alert("Pos=" + Pos);
																			                                                                    if (Pos>0)
																			                                                                    {
																			                                                                            HighValueFeet=HighValue.substring(0, Pos);
																			                                                                           // alert("HighValueFeet=" + HighValueFeet);
																			                                                                            Pos2=length.HighValue
																			                                                                            HighValueInc=HighValue.substring(Pos, Pos2);
																			                                                                            HighValueInc=HighValueInc*Number(MeasurementValue)
																			                                                                            // alert("HighValueMin=" + HighValueMin);
																			                                                                            HighValueInc=Math.round(HighValueInc,2)
																			                                                                     }
																			                                                                     else
																			                                                                     {
																			                                                                        HighValueFeet=HighValue
																			                                                                        HighValueInc=0   
                					                                                                                                             }  
                					                                                                                                             // HighValue=HighValueFeet + "." + HighValueInc
																			                                                                     // alert("HighValue=" + HighValue);
																		                                                                       if (SecondValue!=0)
																		                                                                        {      
                                                                                                                                                 SecondValue=SecondValue.substring(2,6);
                                                                                                                                                }
                                                                                                                                                //alert("SecondValue=" + SecondValue); 
                                                                                                                                                
                                                                                                                                               if (SecondValue==0)
												                                                                                                {
													                                                                                                FinalValue=FirstValue + "." + 0
												                                                                                                }
											                                                                                                    else
												                                                                                                {
													                                                                                                FinalValue=FirstValue + "." + SecondValue
												                                                                                                }
                                                    												                                            

											                                                                                            // alert("IncheFinalValue=" + FinalValue);
											                                                                                             //alert("LowVal=" + LowVal);
													                                                                                            if (FinalValue!="")
														                                                                                            {
                                                																	                                           
                                            																	                                                 if ((LowValue!="0"))
																							                                                                            { 
																												                                                             if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
																		                                                                                                        {
                                                            																		                                                
																			                                                                                                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValueFeet + " " + '<%=vPrompts[33]%>' + " and " + LowValueInc + " " + '<%=vPrompts[34]%>' + ".");		
                                            																			                                                            //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValueFeet + " feet(s) and " + LowValueInc + " Inche(s).");
                                            																			                                                            //ElementOnFocus(EleFeetNameVal,StrQ_type)
																			                                                                                                        AbleButtons()
																			                                                                                                        return false;
																		                                                                                                        }
																		                                                                                                }
																		                                                                                            if ((HighValue!="0"))
																							                                                                            {       
																	                                                                                                        if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
																		                                                                                                        {
																		                                                                                                            alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValueFeet + " " + '<%=vPrompts[33]%>' + " and " + HighValueInc + " " + '<%=vPrompts[34]%>' + ".");		
                                            																                                                                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValueFeet + " feet(s) and " + HighValueInc + " Inche(s).");
                                            																                                                                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValue);					
                                            																			                                                            //ElementOnFocus(EleFeetNameVal,StrQ_type)
																			                                                                                                        AbleButtons()
																			                                                                                                        return false;
																		                                                                                                        }
																														                                                }						
                            																                    
    															                                          
    																																							AnswerForCallForm=AnswerForCallForm + "M-NO|";	
																																						    FirstValue=""
																																						    SecondValue=""
																																						    FinalValue=""
																																					    }
																																	
																																				
																																}//end of inches if statement	
																															
																															//*******************This is for Hour and minute.
																															if (EleName=="txt_Hou")
																																{
																																			
																																			if (isNaN(QuestionAns)==true)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[19].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[58]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																			if ((QuestionAns.indexOf("."))>=0)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[20].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[59]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																	FirstValue=QuestionAns
																																	FirstValue=Number(FirstValue)
																																	// alert("FirstValue=" + FirstValue);
																																}
																															if (EleName=="txt_Min")
																																{
																																		if ((QuestionAns)>59)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[21].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[60]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																		if ((QuestionAns)<0)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[22].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[61]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																		if (isNaN(QuestionAns)==true)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[23].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[61]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																		if ((QuestionAns.indexOf("."))>=0)
																																				{
																																				    //alert(document.aspnetForm.error_msg[0].value + " " + Question + ", " + document.aspnetForm.error_msg[24].value)
																																				    alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[62]%>');
																																				    AbleButtons()
																																				    return false;
																																				}
																																	 SecondValue=QuestionAns
																																	 SecondValue=Number(SecondValue)
																			                                                         SecondValue=SecondValue/60
																			                                                        //alert("SecondValue=" + SecondValue);
																			                                                         SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
																			                                                         //alert("SecondValue=" + SecondValue);
																			                                                          // alert("LowValue=" + LowValue); 
																			                 
																																	Pos=LowValue.indexOf(".")
																			                                                        if (Pos>0)
																			                                                        {
																			                                                            LowValueHour=LowValue.substring(0, Pos);
																			                                                            //alert("LowValueHour=" + LowValueHour); 
																			                                                            Pos2=length.LowValue
																			                                                            LowValueMin=LowValue.substring(Pos, Pos2);
																			                                                            LowValueMin=LowValueMin*60
																			                                                            //alert("LowValueMin=" + LowValueMin);
																			                                                            LowValueMin=Math.round(LowValueMin,2)
																			                                                         }
																			                                                         else
																			                                                         {
																			                                                            LowValueHour=LowValue
																			                                                            LowValueMin=0
																			                                                         }
																			                                                        LowValue1=LowValueHour + "." + LowValueMin
																			                                                         //alert("LowValue1=" + LowValue1); 
																																	Pos=HighValue.indexOf(".")
																			                                                       // alert("Pos=" + Pos);
																			                                                        if (Pos>0)
																			                                                        {
																			                                                                HighValueHour=HighValue.substring(0, Pos);
																			                                                               // alert("HighValueHour=" + HighValueHour);
																			                                                                Pos2=length.HighValue
																			                                                                HighValueMin=HighValue.substring(Pos, Pos2);
																			                                                                HighValueMin=HighValueMin*60
																			                                                                // alert("HighValueMin=" + HighValueMin);
																			                                                                HighValueMin=Math.round(HighValueMin,2)
																			                                                         }
																			                                                         else
																			                                                         {
																			                                                            HighValueHour=HighValue
																			                                                            HighValueMin=0   
                					                                                                                                 }  
                					                                                                                                  HighValue1=HighValueHour + "." + HighValueMin
																																	 //alert("HighValue1=" + HighValue1);
																																	 //alert("HighValue=" + HighValue);
																																	 //alert("Question=" + Question);
																																	 
																		                                                               if (SecondValue!=0)
																		                                                                {      
                                                                                                                                         SecondValue=SecondValue.substring(2,6);
                                                                                                                                        }
                                                                                                                                       if (SecondValue==0)
																																		{
																																			FinalValue=FirstValue + "." + 0
																																		}
																																	    else
																																		{
																																			FinalValue=FirstValue + "." + SecondValue
																																		}

																																	 //alert("MinFinalValue=" + FinalValue);
																																	  if  (FinalValue!="")  
																							                                            {
                                    																									    
																							                                                            if ((LowValue!="0"))
																					                                                                        { 
																										                                                         if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
																                                                                                                    {
                                                																		                                                
																	                                                                                                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValue);
                                    																			                                                        //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValueHour + " hour(s) and " + LowValueMin + " minute(s).");
                                    																			                                                        alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValueHour + " hour(s) and " + LowValueMin + " minute(s).");
																	                                                                                                    AbleButtons()
																	                                                                                                    return false;
																                                                                                                    }
																                                                                                            }
																                                                                                        if ((HighValue!="0"))
																					                                                                        {       
															                                                                                                    if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
																                                                                                                    {
                                    																                                                                    //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValueHour + " hour(s) and " + HighValueMin + " minute(s).");
                                    																                                                                     alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValueHour + " hour(s) and " + HighValueMin + " minute(s).");
                                    																                                                                    AbleButtons()
																	                                                                                                    return false;
																                                                                                                    }
																												                                            }								
                                    																																				 
																																				FirstValue=""
																																				SecondValue=""
																																				FinalValue=""
																																				AnswerForCallForm=AnswerForCallForm + "H-NO|";	
																																			}// if  (FinalValue!="")  
																															
																																				
																																}//end of Hour and minute	
                    					                                                    
                    					                                                    
					                                                                 }//end of  QuestionAns!="" 
					                                          }//end of if ((Name=="txt_Dol")||(Name=="txt_Cen")||(Name=="txt_Fee")||(Name=="txt_Inc")||(Name=="txt_Hou")||(Name=="txt_Min"))
					                                          if ((EleName=="txt_num")||(EleName=="txt_dat")||(EleName=="txt_txt"))
					                                          {
					                                                                QuestionAns=eval("document.aspnetForm." + EachElementobj + ".value")
                                                                                    //alert("QuestionAns=" + QuestionAns) 
                                                                                    QuestionAns=Trim(QuestionAns)
                                                                                   if (EleName=="txt_num")
                                                                                   {
                                                                                                        if (checkNumber(QuestionAns)==false)
								                                                                            {
								                                                                                // alert("test")
								                                                                                 alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[40]%>');
                                                                                                                //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                                                                                AbleButtons()
                                                                                                                return false;
								                                                                            }        
                                                                                                        if (isNaN(QuestionAns)==true)
																											{
																											    //alert(document.aspnetForm.error_msg[0].value + " " + Question + " " + document.aspnetForm.error_msg[1].value)
																											    alert('<%=vPrompts[39]%>' + " " + Question + " " + '<%=vPrompts[40]%>');
																											     AbleButtons()
																											    return false;
																											}
																										ILang_Id=document.aspnetForm.ILang_Id.value
																										if (ILang_Id=="10") 
																											{
																														
																														textBoxValue2=Number(QuestionAns)
																														//alert("textBoxValue2=" + textBoxValue2)
																														if (Trim(textBoxValue2)=="NaN")
																															{
																																//alert("" + document.aspnetForm.error_msg[28].value + " " + Question + "")
																																alert('<%=vPrompts[67]%>' + " " + Question + "");
																																AbleButtons()
																																return false;
																															}
																														//Decimal Points
																															Decimal_Point=document.aspnetForm.Decimal_Point.value
																															//alert("Decimal_Point=" + Decimal_Point)
																															
																															DotLen=QuestionAns.indexOf(".")+1
																															//alert("DotLen=" + DotLen)
																															BoxLen=QuestionAns.length
																															//alert("BoxLen=" + BoxLen)
																														if (DotLen!="0")
																																{
																																		FinalLen=BoxLen-DotLen
																																		if (FinalLen>Decimal_Point)
																																			{
																																				//alert("" + document.aspnetForm.error_msg[28].value + " " + Q_No_Loop + "")
																																				alert('<%=vPrompts[67]%>' + " " + Question + "");
																																				AbleButtons()
																																				return false;
																																			}
																																}
																												}
																											else
																												{
																														textBoxValue2=QuestionAns
																														if ((QuestionAns.indexOf("."))>=0)
																																{
																																	//alert(document.aspnetForm.error_msg[0].value + " " + Question + " " + document.aspnetForm.error_msg[27].value)
																																	alert('<%=vPrompts[39]%>' + " " + Question + " " + '<%=vPrompts[66]%>' + "");
																																	AbleButtons()
																																	return false;
																																}
																												}
																											  if  (LowValue!="0") 
											                                                                         {		
																										                if ((eval(LowValue)>eval(textBoxValue2))&&(LowValue!=""))
																											                {
																												                //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + LowValue);
																												                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + LowValue);
																												                AbleButtons()
																												                return false;
																											                }
    																											      } 
    																										 if  (HighValue!="0") 
											                                                                         {     
																										                if ((eval(HighValue)<eval(textBoxValue2))&&(HighValue!=""))
																											                {
                																																
																												                //alert("HighValue=" + HighValue);
																												                //alert("textBoxValue=" + textBoxValue);
                																																	
																												                //alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + HighValue);	
																												                alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + HighValue);				
																												                AbleButtons()
																												                return false;
																											                }
																											          }
																								AnswerForCallForm=AnswerForCallForm + "N-NO|";				
                                                                                    }//if (EleName=="txt_num")
                                                                                    if (EleName=="txt_dat")
																					{
																							             QuestionAns=eval("document.aspnetForm." + EachElementobj + ".value")
                                                                                                         //alert("QuestionAns=" + QuestionAns) 
																							            //alert("TextdatCheck=" + TextdatCheck);
            																						        if (DatecheckNumber(QuestionAns)==false)
									                                                                                {
									                                                                                    alert('<%=vPrompts[44]%>' + " " + Question);
                                                                												        AbleButtons()
                                                                                                                        return false;
									                                                                                }     
																								            if (DateValidation(QuestionAns, document.aspnetForm.DateRule.value,'<%=vPrompts[45]%>')==false)
																										            {
																											            //alert(document.test.error_msg[5].value + " " + Question);
																											            alert('<%=vPrompts[44]%>' + " " + Question + "");
																											            AbleButtons()
																											            return false;
																										            }
																								            //Check for high and low values 	
																								            if (DateHighLowCheck(QuestionAns,LowValue,HighValue,document.aspnetForm.DateRule.value,Question)==false)
																										            {
																											            //alert(document.test.error_msg[5].value + " " + Question);
																											            alert('<%=vPrompts[44]%>' + " " + Question + "");
																											            AbleButtons()
																											            return false;
																										            }
																								             
																		                                
																						AnswerForCallForm=AnswerForCallForm + "D-NO|";		
																					}
                                                    
                                                                                    if (QuestionAns=="") 
																                    {
																	                    //alert(document.test.error_msg[7].value + " " + Question)
																	                    alert('<%=vPrompts[43]%>' + " " + Question)
																	                    //alert("here") 
																	                    AbleButtons()
																	                    return false;
															                        }  
                                                                                  if (QuestionAns!="")
                                                                                    {
					                                                                        StatusFlag=true;
					                                                                }
					                                          
					                                             
					                                          }
									        }//end of Eledisabled==false)
							                        
							}
				        //Check for radio or checkbox 
				          	if ((EleName=="chk_qno")||(EleName=="rad_qno"))	
			                {	
												
												
			                            
							                    k=eval("document.aspnetForm." + EachElementobj + ".length")
							                    // alert("k55=" + k)	
							                    LenCheck=String(k)
                    																
							                    if (LenCheck=="undefined")
									                    {
									                                Eledisabled=eval("document.aspnetForm." + EachElementobj + ".disabled")
									                                //alert("Eledisabled=" + Eledisabled) 
									                                 if (Eledisabled==false)
									                                     {
									                                            QuestionAns=eval("document.aspnetForm." + EachElementobj + ".checked")
		                                                                       // alert("QuestionAns=" + QuestionAns) 
		                                                                      if (QuestionAns==true)
		                                                                        {
		                                                                                 
		                                                                                 ArrayNameAnsVal= EachElementAns_Val.split("-");
		                                                                                 AnsName= ArrayNameAnsVal[0].valueOf()
                                                                                         AnsValue= ArrayNameAnsVal[1].valueOf()
 		                                                                                //alert("AnsName=" + AnsName) 
 			                                                                            //alert("AnsValue=" + AnsValue) 
 			                                                                            //alert("EachElementobj=" + EachElementobj) 
		                                                                               
		                                                                                 eval("document.aspnetForm." + EachElementobj + ".value=" + AnsValue + "")
									                                                    StatusFlag=true;
									                                            }
									                                     }
									                                  if (Eledisabled==true)
									                                     {
									                                        StatusFlag=true;
									                                     }
									                    }					
							                    else
									                    {
												                    for (n=0; n<k; n++)
													                    {
    														        
														                         Eledisabled=eval("document.aspnetForm." + EachElementobj + "[n].disabled")
									                                            //alert("Eledisabled=" + Eledisabled) 
									                                            if (Eledisabled==false)
									                                                {
									                                                         EachElementAns_Val = ArrayEleAns_Val[D].valueOf()
                                                                                             //alert("EachElementAns_Val=" + EachElementAns_Val)  
                                                                                             ArrayNameAnsVal= EachElementAns_Val.split("-");
                                                                                             
									                                                        QuestionAns=eval("document.aspnetForm." + EachElementobj + "[n].checked")
									                                                         //alert("QuestionAns=" + QuestionAns) 
									                                                          if (QuestionAns==true)
									                                                            {
                                                                                                    AnsName= ArrayNameAnsVal[0].valueOf()
                                                                                                    AnsValue= ArrayNameAnsVal[1].valueOf()
			                                 
									                                                                 //alert("AnsNameTrue=" + AnsName) 
			                                                                                         //alert("AnsValueTrue=" + AnsValue) 
			                                                                                        
			                                                                                        if (EleName=="chk_qno")
			                                                                                        {
			                                                                                            AnswerForCallForm=AnswerForCallForm + "C-" + AnsValue + "|";
			                                                                                            eval("document.aspnetForm." + EachElementobj + "[n].value=" + AnsValue + "")
			                                                                                        }
			                                                                                        if (EleName=="rad_qno")
			                                                                                        {
			                                                                                            AnswerForCallForm=AnswerForCallForm + "R-" + AnsValue + "|";
			                                                                                             eval("document.aspnetForm." + EachElementobj + "[n].value=" + AnsValue + "")
			                                                                                        }
									                                                                StatusFlag=true;
									                                                                 test2=eval("document.aspnetForm." + EachElementobj + "[n].value")
									                                                                //alert("test2="+ test2);
									                                                               // alert("EachElementobj="+ EachElementobj);
									                                                                //alert("AnswerForCallForm="+ EachElementobj);
									                                                                
									                                                            }
									                                                }
									                                              if (Eledisabled==true)
									                                                 {
									                                                    StatusFlag=true;
									                                                 }
									                                         D=D+1
													                    }
													              
													             D=D-1  
									                    }
									             if (StatusFlag==false)
							                             {
							                                    alert('<%=vPrompts[43]%>' + " " + Question + "");
							                                     //alert("here2") 
							                                     AbleButtons()
							                                    return false;
							                             }
							     //F=k-1;
							     //D=D+F;                         		
			                }//ending of if ((Ans_Type=="chk_qno")||(Ans_Type=="rad_qno"))
					D=D+1;	
							   						      
		        }//for ( s = 0; s < arraylength ; s++ )
		         //document.aspnetForm.CallFormAnswers.value=AnswerForCallForm;	
		        //Test=document.aspnetForm.CallFormAnswers.value;
		       // alert("Test="+ Test);
		 //return false;
        //alert("Go to next page.") 
		//return false;		
	 document.aspnetForm.action="CFCallFormValidate.aspx";
	// document.aspnetForm.action="Testprocedure.aspx";
	document.aspnetForm.submit();
	return false;
}
//********************* checking for date

		 																			
function DateHighLowCheck(StrDate,LowValue,HighValue,v_date_sys_rule,Question)
{
            		//alert("v_date_sys_rule="+ v_date_sys_rule);
		
		 POS=LowValue.indexOf(".")
		 LowValue=LowValue.substring(0,POS) 
		// alert("LowValue="+ LowValue);
         POS1=HighValue.indexOf(".")
		 HighValue=HighValue.substring(0,POS1) 
		// alert("HighValue="+ HighValue);
		 
		LenLowValue=LowValue.length
		LenHighValue=HighValue.length
		if (LenLowValue==5)
		{
			LowValue="0" + LowValue 
		}
		if (LenHighValue==5)
		{
			HighValue="0" + HighValue 
		}
		if (LenLowValue==7)
		{
			LowValue="0" + LowValue 
		}
		if (LenHighValue==7)
		{
			HighValue="0" + HighValue 
		} 
		 //alert("LowValue00="+ LowValue);
		 // alert("HighValue00="+ HighValue);
		 //alert("LenLowValue="+ LenLowValue);
		 //alert("LenHighValue="+ LenHighValue);
		SubLowValue=LowValue
		SubLowLen=SubLowValue.length
		SubHighValue=HighValue
		SubHighLen=SubHighValue.length
		
		E_delimiter=document.aspnetForm.Date_input.value
			
		var StrDatearray = StrDate.split(E_delimiter)
		//alert("Date_input="+ Date_input);
		DateRulearray = v_date_sys_rule.split(E_delimiter)
		var EnterDate=""
		for(c=0; c<DateRulearray.length; c++)
			{
						if (DateRulearray[c] == "mm")
							{ 
									v_month = StrDatearray[c];
									monthNum=Number(v_month)
									monthNum= Trim(monthNum)
									Monlen=monthNum.length
								//For low values
									LowMonth=SubLowValue.substring(0,2)
								// alert("LowMonth=" + LowMonth);
									SubLowValue=SubLowValue.substring(2,SubLowLen) 
								//For High values
									HighMonth=SubHighValue.substring(0,2)
									// alert("HighMonth=" + HighMonth);
									SubHighValue=SubHighValue.substring(2,SubHighLen) 
									
								if (Monlen==1)
									{
										monthNum="0"+ monthNum
									}
								if (EnterDate=="")
									{
										EnterDate= monthNum
										LowDate=LowMonth 
										HighDate=HighMonth
									}
								else
									{
										LowDate= LowDate + "" + E_delimiter + "" + LowMonth
										HighDate= HighDate + "" + E_delimiter + "" + HighMonth
										EnterDate= EnterDate + "" + monthNum
									}
								
										 
							}
							
							
						if (DateRulearray[c] == "dd")
							{
								
										v_day = StrDatearray[c];
										 dayNum=Number(v_day)
										dayNum= Trim(dayNum)
										daylen=dayNum.length
									 //For Low values
										 LowDay=SubLowValue.substring(0,2)
										 SubLowValue=SubLowValue.substring(2,SubLowLen)
									  	// alert("LowDay=" + LowDay);
									 //For High values
										HighDay=SubHighValue.substring(0,2)
										// alert("HighDay=" + HighDay);
										SubHighValue=SubHighValue.substring(2,SubHighLen) 
									  	 
									if (daylen==1)
										{
											dayNum="0"+dayNum
										}
									if (EnterDate=="")
										{
											EnterDate= dayNum 
											LowDate=LowDay 
											HighDate=HighDay
										}
									else
										{
											LowDate= LowDate + "" + E_delimiter + "" + LowDay
											HighDate= HighDate + "" + E_delimiter + "" + HighDay
											EnterDate= EnterDate + "" + dayNum
										}
										
									
									   //alert("SubLowValuem=" + SubLowValue);
									 
							}
						if (DateRulearray[c] == "yy" || DateRulearray[c] == "yyyy")
							{
								Year_Size=DateRulearray[c]	
								v_year = StrDatearray[c];
								YearNum= Trim(v_year)
								Yearlen=YearNum.length
								   if (Yearlen==2)
										{	
											LowYear=SubLowValue.substring(0,2)
										     //alert("LowYear2=" + LowYear);
											SubLowValue=SubLowValue.substring(2,SubLowLen)
											//For High values
											HighYear=SubHighValue.substring(0,2)
										    //alert("HighYear2=" + HighYear);
											SubHighValue=SubHighValue.substring(2,SubHighLen) 
										}
									else
										{
											LowYear=SubLowValue.substring(0,4)
											 // alert("LowYear4=" + LowYear);
											SubLowValue=SubLowValue.substring(4,SubLowLen) 
											//For High values
											HighYear=SubHighValue.substring(0,4)
											 // alert("HighYear4=" + HighYear);
											SubHighValue=SubHighValue.substring(4,SubHighLen) 
										}
								if (EnterDate=="")
										{
											EnterDate= v_year
											LowDate=LowYear 
											HighDate=HighYear
										}
									else
										{
											LowDate= LowDate + "" + E_delimiter + "" + LowYear
											HighDate= HighDate + "" + E_delimiter + "" + HighYear
											EnterDate= EnterDate + "" + v_year
										}
									
									LenYear=Year_Size.length
									//alert("LenYear="+ LenYear);
									//alert("SubLowValue="+ SubLowValue);
									
										
							}
			}
			
			 //alert("EnterDate="+ EnterDate);
			// alert("LowValue="+ LowValue);c
			// alert("HighValue="+ HighValue);
			
			//alert("Year_Size="+ Year_Size);
			//alert("v_month="+ v_month);
			//alert("v_day="+ v_day);
			//alert("v_year="+ v_year);
	
		 //alert("LowDate="+ LowDate );
		//alert("HighDate="+ HighDate );
		//myNewString=number(myNewString)
		
		DisplayLowDate=LowDate
		DisplayhighDate=HighDate
		
		 if (LenYear==2)
			{	
					EnterDate="" + monthNum + "/" + dayNum + "/20" + v_year	
					LowDate="" + LowMonth + "/" + LowDay + "/20" + LowYear		
					HighDate="" + HighMonth + "/" + HighDay + "/20" + HighYear			
			}
		else
			{
				    EnterDate="" + monthNum + "/" + dayNum + "/" + v_year	
				    LowDate="" + LowMonth + "/" + LowDay + "/" + LowYear
				    HighDate="" + HighMonth + "/" + HighDay + "/" + HighYear	
			}
			
			// alert("LowDatefin="+ LowDate);
			 // alert("HighDatefin="+ HighDate);
			// alert("EnterDate="+ EnterDate);

		if (LowValue!=0)
			{
				if (Date.parse(EnterDate)<Date.parse(LowDate))
				{
					//alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + DisplayLowDate);
					alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[41]%>' + " " + DisplayLowDate);

					//result = false;																												
					return false;
				}
			}
		if (HighValue!=0)
			{if (Date.parse(EnterDate)>Date.parse(HighDate))
				{
				
						//alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + DisplayhighDate);
						alert('<%=vPrompts[39]%>' + " " + Question + ", " + '<%=vPrompts[42]%>' + " " + DisplayhighDate);
					//result = false;						
					return false;
				}
			}
	 
	 //******************** Date can not be less 1/1/1900 and bigger than 6/6/2079
	  
				if (Date.parse(EnterDate)<Date.parse('01/01/1900'))
				{
					 return false;
				}
			 
	 
				if (Date.parse(EnterDate)>Date.parse('06/06/2079'))
				{
					 return false;
				}
			 
}



function DateValidation(v_date_object, v_date_sys_rule, v_error_msg)
	{
		  //alert("v_date_object="+ v_date_object);
		 //alert("v_date_sys_rule="+ v_date_sys_rule);
		 //alert("v_error_msg="+ v_error_msg);
		
		var v_date_format
		var v_date
		var datearray
		var dateformatarray
		var v_month
		var v_day
		var v_year
		var i
		var v_delimiter
		v_date_format = v_date_sys_rule
		for(i=0; i<v_date_format.length; i++)
		{
				//alert("LoopValue="+ v_date_format.charAt(i).toUpperCase());
			if((v_date_format.charAt(i).toUpperCase()!='Y')&&(v_date_format.charAt(i).toUpperCase()!="M")&&(v_date_format.charAt(i).toUpperCase()!='D'))
			{
				//alert("1="+ v_date_format.charAt(i).toUpperCase());

				v_delimiter= v_date_format.charAt(i)
				break;	
			}
		}
		//alert("v_delimiter="+ v_delimiter);
		//v_date = eval(v_date_object+ ".value");
		v_date = v_date_object
		//alert("v_date_format="+ v_date_format);
		dateformatarray = v_date_format.split(v_delimiter)
		var datearray = v_date.split(v_delimiter)
		
		if ((dateformatarray.length) != (datearray.length))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		
		for(i=0; i<dateformatarray.length; i++)
		{
			if (dateformatarray[i] == "mm")
			{
			v_month = datearray[i];
			}
			if (dateformatarray[i] == "dd")
			{
			v_day = datearray[i];
			}
			if (dateformatarray[i] == "yy" || dateformatarray[i] == "yyyy")
			{
				Year_Size=dateformatarray[i]	
				v_year = datearray[i];
			}
		}
		
		//if (eval(v_day.length!=2))
		//{
		//		alert(v_error_msg)
				//eval(v_date_object + ".focus()")
		//		result = false;
		//		return false;
		//}
		//if (eval(v_month.length!=2))
		//{
		//		alert(v_error_msg)
				//eval(v_date_object + ".focus()")
		//		result = false;
		//		return false;
		//}
		
		for(i=0; i<v_day.length; i++)
		{
			if(isNaN(v_day.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				//result = false;
				return false;
			}
		}
		for(i=0; i<v_month.length; i++)
		{
			if(isNaN(v_month.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				//result = false;
				return false;
			}
		}
		for(i=0; i<v_year.length; i++)
		{
			if(isNaN(v_year.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				//result = false;
				return false;
			}
		}
		
		//alert("v_year="+ v_year);
		LenYear=v_year.length
		//alert("LenYear="+ LenYear);
		//alert("LenYear="+ LenYear);
		Year_Size_no=Year_Size.length
		//alert("LenYear="+ LenYear);
		if (Year_Size_no!=LenYear)
		{
			alert(v_error_msg)
			return false;
		}
		
		
		if((v_month=="") || (v_day=="") || (v_year==""))
		{
			alert(v_error_msg)
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if (v_month <1 || v_month >12)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if (isNaN(v_month ))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if (v_day<1 || v_day>31)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if (isNaN(v_day))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if (isNaN(v_year))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if ((v_year < 0) || (v_year.length < 2) || (v_year.length > 4))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		if ((v_month ==4 || v_month ==6 || v_month ==9 || v_month ==11) && v_day==31)
		{
			alert (v_error_msg)
			//eval(v_date_object + ".focus()")
			//result = false;
			return false;
		}
		
		if (v_month  == 2)
		{
			isleap = (v_year %4 == 0 && (v_year % 100 != 0 || v_year % 400 == 0));
			if (v_day>29 || (v_day==29 && !isleap))
			{
				alert (v_error_msg);
				//eval(v_date_object + ".focus()")
				//result = false;
				return false;
			} 
		} 
	}
	

//************************* Philip Morris Check function (Freq_Code and High_visibility) *******************************

function PM_Freq_High_Visibility_Check_Sigle(QuestionValue,Question,textBoxValue,textname,tempobj)
{

		Freq_Code=document.aspnetForm.Freq_Code.value
		High_Visibility=document.aspnetForm.High_Visibility.value
		job_no=document.aspnetForm.job_no.value
		Wave_No=document.aspnetForm.Wave_No.value
		Task_No=document.aspnetForm.Task_No.value
		//alert("Freq_Code=" + Freq_Code);
		//alert("Question=" + Question);
		//alert("High_Visibility=" + High_Visibility);
		//alert("textBoxValue=" + textBoxValue);
		
		if ((job_no=="100400") && (Wave_No>=200423) &&(Task_No!="20"))
		{
				Ans_val=textBoxValue.substring(0,1)
				if (Question=="1")
					{
							//alert("Ans_val=" + Ans_val);
							//alert("QuestionValue=" + QuestionValue);
							//alert("textBoxValue=" + textBoxValue);
							
							if (Ans_val!=Freq_Code)
								{
										
										var ok=confirm("The size of the BOG you selected does not match the size printed on your mailing report.\n Are you sure you have selected the correct size?")
										if (ok)
											{
												tempobj.checked=false
												alert("Please answer 001")
															
											}
												
								}
							if (Ans_val=="2")
								{
									PM_Question_One_Flag="Y"
								}
					}
					
				if (Question=="2")
					{
									if (Ans_val=="0")
										{
												Show_Message_Flag="Y"
											if (High_Visibility=="H")
												{
													Show_Message_Flag="N"
												}
											if (High_Visibility=="S") 
												{
													Show_Message_Flag="N"
												}
											if (Show_Message_Flag=="Y")
												{
																
														var ok=confirm("The fixture size you selected does not match the size printed on your mailing report. Are you sure you you have selected the correct fixture size?");
														if (ok)
															{
																tempobj.checked=false
																alert("Please answer 002")
																			
															}	
																
												}
										}
									if (Ans_val=="1")
										{
											if (High_Visibility!="L") 
												{
															
														var ok=confirm("The fixture size you selected does not match the size printed on your mailing report. Are you sure you you have selected the correct fixture size?");
														if (ok)
																{
																	tempobj.checked=false
																	alert("Please answer 002")
																				
																}
																	
												}
										}	
				}	
				
			//alert("PM_Question_One_Flagsasdasd=" + PM_Question_One_Flag);	
		}//ending job_no=="100400") && (Wave_No>=200423) &&(Task_No!="20"
	return PM_Question_One_Flag
}

function PM_Freq_High_Visibility_Check_numeric(QuestionValue,Question,textBoxValue,PM_SumValue,textname,tempobj)
{
		Show_Message_45=""
		Freq_Code=document.aspnetForm.Freq_Code.value
		High_Visibility=document.aspnetForm.High_Visibility.value
		job_no=document.aspnetForm.job_no.value
		Wave_No=document.aspnetForm.Wave_No.value
		Task_No=document.aspnetForm.Task_No.value
	
		//alert("QuestionValue=" + QuestionValue);
		//alert("Freq_Code=" + Freq_Code);
		//alert("High_Visibility=" + High_Visibility);
		//alert("textBoxValue=" + textBoxValue);
		//alert("PM_Question_One_Flag_NNN=" + PM_Question_One_Flag);
		//alert("textname=" + textname); 

		
		
		if ((job_no=="100400") && (Wave_No>=200423) &&(Task_No!="20"))
		{
				if (QuestionValue=="4")
					{
						PM_Q4_Value=textBoxValue
						//document.aspnetForm.Remove_Response_Q4.value=textname
					}
					//alert("PM_Q4_Value=" + PM_Q4_Value);	
				if (Question=="5")
					{
							if (PM_Q4_Value!=textBoxValue)
								{
										Show_Message_45="Y"
								}	
							//alert("PM_SumValue=" + PM_SumValue);
							if (PM_Question_One_Flag=="Y")
								{
									if (PM_SumValue>"0")
										{
											Show_Message_45="Y"		
										}
										
								}
							if (Show_Message_45=="Y") 
								{	
										var ok=confirm("Based upon the BOG size you selected your response to this question is invalid. Please reenter.") 
										if (ok)
											{
												document.aspnetForm.txt_num004.value=''
												tempobj.value=''
												alert("Please answer 004 and 005")
																
											}
														
								}
					}
				
		}
	return PM_Q4_Value		
}
	
//************************* Trim function *******************************
function Trim(str) {
	var resultStr = "";
	
	resultStr = TrimLeft(str);
	resultStr = TrimRight(resultStr);
	
	return resultStr;
}
function TrimLeft(str) {
	var resultStr = "";
	var i = len = 0;

	// Return immediately if an invalid value was passed in
	if (str+"" == "undefined" || str == null)	
		return null;

	// Make sure the argument is a string
	str += "";

	if (str.length == 0) 
		resultStr = "";
	else {	
  		// Loop through string starting at the beginning as long as there are spaces.
//	  	len = str.length - 1;
		len = str.length;
		
  		while ((i <= len) && (str.charAt(i) == " "))
			i++;

   		// When the loop is done, we're sitting at the first non-space char,
 		// so return that char plus the remaining chars of the string.
  		resultStr = str.substring(i, len);
  	}

  	return resultStr;
}
function TrimRight(str) 
{
	var resultStr = "";
	var i = 0;

	// Return immediately if an invalid value was passed in
	if (str+"" == "undefined" || str == null)	
		return null;

	// Make sure the argument is a string
	str += "";
	
	if (str.length == 0) 
		resultStr = "";
	else {
  		// Loop through string starting at the end as long as there are spaces.
  		i = str.length - 1;
  		while ((i >= 0) && (str.charAt(i) == " "))
 			i--;
 			
 		// When the loop is done, we're sitting at the last non-space char,
 		// so return that char plus all previous chars of the string.
  		resultStr = str.substring(0, i + 1);
  	}
  	
  	return resultStr;  	
}



function QuestionValidateTest(textBoxValue,Q_type,tempobj,textname)
{
	//alert("textBoxValue=" + textBoxValue);
	//alert("textname=" + textname);
	//alert("Q_type=" + Q_type);
	 alert("QuestionValidateTest")
	
	if (Q_type=="N")
		{
			textBoxValue="0" + textBoxValue
			//alert("textname=" + textname);
			//return false;
		}
		//alert("textnameout=" + textname);
	//alert("Q_type=" + Q_type);
	
	SaveAnswers=document.aspnetForm.SaveAnswers.value;
	if (SaveAnswers=="")
		{
			AnswerNumber="" + textBoxValue + ","
		} 
	else
		{
			AnswerNumber="" + SaveAnswers + "" + textBoxValue + ","
		} 
		document.aspnetForm.SaveAnswers.value=AnswerNumber
		SaveAnswers=document.aspnetForm.SaveAnswers.value;
																																		
		//alert("SaveAnswers=" + SaveAnswers);
		//alert("textBoxValue=" + textBoxValue);
	
	
	HiddenQuestion=document.aspnetForm.HiddenQuestion.value
	//alert("HiddenQuestion=" + HiddenQuestion)
	if (HiddenQuestion!="")
		{
																																																																		
				//alert("Test")
				HiddenArray = HiddenQuestion.split(",");
				arraylength = HiddenArray.length
				//alert("arraylength=" + arraylength) 
				arraylength=eval(arraylength-1)
				for ( z = 0 ; z < arraylength ; z++ )
					{
									ArrayElement = HiddenArray[z].valueOf()	
									//alert("ArrayElement=" + ArrayElement)
									if (ArrayElement==textBoxValue)
										{
												//alert("Good")
												NameOfHidden="NA" + ArrayElement
												NAList=eval("document.aspnetForm." + NameOfHidden + ".value")
												//alert("NAList=" + NAList)
																																												
												SaveAnswersArray = SaveAnswers.split(",");
												SaveArraylength = SaveAnswersArray.length
												//alert("SaveArraylength=" + SaveArraylength) 
												SaveArraylength=eval(SaveArraylength-1)
												for ( y = 0 ; y < SaveArraylength ; y++ )
													{
																	SaveAnswersElement = SaveAnswersArray[y].valueOf()	
																	//alert("SaveAnswersElement=" + SaveAnswersElement)
																		NAListArray = NAList.split(",");
																		NAListArraylength = NAListArray.length
																		//alert("SaveArraylength=" + SaveArraylength) 
																		NAListArraylength=eval(NAListArraylength-1)
																	for ( x = 0 ; x < NAListArraylength ; x++ )
																		{
																				NAListArrayElement = NAListArray[x].valueOf()
																					if (NAListArrayElement==SaveAnswersElement)
																					{
																							//alert("This is an incorrect answer for this question.");
																							//alert(document.aspnetForm.error_msg[25].value);
																							 alert('<%=vPrompts[64]%>');

																							if (Q_type=="N")
																							{
																								tempobj.value=""		
																								//tempobj.readonly=true
																								eval("document.aspnetForm." + textname + ".readOnly='true'")
																								
																									//document.aspnetForm.txt_num004.readOnly=true
																								tempobj.style.backgroundColor = "yellow";
																							}
																							else
																							{
																								tempobj.checked=false
																								return false;
																							}																																		
																							
																					}//NAList equal condition
																		}
													}
										}//end of ArrayElement check
																																										
					}//end of hiddenArray				
	}//end of HiddenQuestion is nothing	
}

//************************************** For RTS 

function RTSIssuesCheck(Question,QuestionValue,textBoxValue,tempobj,textname)
{
             //alert("IN RTS");
			 //alert("RTSIssuesCheckQuestionValue=" + QuestionValue);
			 //alert("RTSIssuesChecktextBoxValue=" + textBoxValue);
			// alert("RTSIssuesChecktextname=" + textname);
			 //alert("RTSIssuesCheckQuestion=" + Question);
			
			ElementStatus=tempobj.checked;
			//alert("ElementStatus=" + ElementStatus);
			
	
			document.aspnetForm.RTS_Issue_Q_no.value=Question
			//document.aspnetForm.RTS_Issue_Q_no.value=
			if (tempobj.checked==true)
			{
				
				
				
										//******************* Issue flag created by a table jwt_rts_edit_check
										Issue_Questions=document.aspnetForm.Issue_Questions.value
										 //alert("Issue_Questions=" + Issue_Questions)	
										if (Issue_Questions!="")
											{	
														IssueArray = Issue_Questions.split(",");
														arraylen = IssueArray.length
														//alert("arraylength=" + arraylength) 
														arraylen=eval(arraylen-1)
													
														for ( p = 0 ; p < arraylen ; p++ )
															{
																	ArrayElement = IssueArray[p].valueOf()
																	//alert("ArrayElement_Issue=" + ArrayElement) 
																	//alert("textBoxValue_Issue=" + textBoxValue) 	
																	if (ArrayElement==textBoxValue)
																			{		
																				document.aspnetForm.Here_RTS_Issue.value="Y"
																				//RTS_Saving_Answers(Question,QuestionValue,textBoxValue,textname)
																				return true;		
																			}	
															}
											}//Ending of HistoryCheck.
				}//Ending of "IF" tempobj.checked==true	
	return false;
}	
function RTS_Saving_Answers()
{
	//alert("RTS_Saving_Answers") 
								Name_Of_Elements=document.aspnetForm.CallForm_Elements.value;
			
								ArrayAList = Name_Of_Elements.split("|");
								arraylength = ArrayAList.length
								//alert("arraylength=" + arraylength) 
								arraylength=eval(arraylength-1)
								Str_Get_Answer=""
			
			                    
			
			
								for (p = 0 ; p < arraylength ; p++ )
									{
									                //***** Name of all the array 
									                //ArrayEleSaveRTS = ArraySaveRTS_Val[p].valueOf()
                                                    //ArrayEleSaveRTS=ArrayEleSaveRTS.substring(0,ArrayEleSaveRTS.length-1);
			                                        //alert("ArrayEleSaveRTS=" + ArrayEleSaveRTS)
			                                        
			                                        
													ElementName = ArrayAList[p].valueOf()
													//alert("ElementName=" + ElementName)
													ElementNameVal="ctl00$ContentPlaceHolder1$" + ElementName + ""; 
													Name=ElementName.substring(0,7)
													Q_No_Loop=ElementName.substring(7,10)
													 //alert("Q_No_Loop1=" + Q_No_Loop)
													//Q_No_Loop=Number(Q_No_Loop)
													 
													ValueOfElement=""
													
																if ((Name=="txt_num")||(Name=="txt_dat")||(Name=="txt_txt")||(Name=="txt_Dol")||(Name=="txt_Cen")||(Name=="txt_Fee")||(Name=="txt_Inc")||(Name=="txt_Hou")||(Name=="txt_Min"))	
																	{
																					Q_CheckDisable=eval("document.aspnetForm." + ElementNameVal + ".disabled")
																					if (Q_CheckDisable==false)
																						{	
																							ValueOfElement=eval("document.aspnetForm." + ElementNameVal + ".value")
																							 //alert("ValueOfElement=" + ValueOfElement)
																						}
																					else
																						{
																							ValueOfElement="D"
																						}
																					//alert("ValueOfElement=" + ValueOfElement)
																					if (ValueOfElement!="")
																						{
																							if (Str_Get_Answer=="")
																								{
																									Str_Get_Answer="" + ElementName + "^" + ValueOfElement + ""
																								}
																							else
																								{
																									Str_Get_Answer="" + Str_Get_Answer + "|" + ElementName + "^" + ValueOfElement + ""
																								}
																							//alert("Str_Get_Answer=" + Str_Get_Answer)
																						}	
																	}				
																else
																	{
																				
																					k=eval("document.aspnetForm." + ElementNameVal + ".length")
																					//alert("kV=" + k)	
																					LenCheck=String(k)
																					if (LenCheck=="undefined")
																						{	
																								Q_CheckDisable=eval("document.aspnetForm." + ElementNameVal + ".disabled")
																								if (Q_CheckDisable==false)
																									{	
																												RadioValue=eval("document.aspnetForm." + ElementNameVal + ".checked")
																												//alert("RadioValue=" + RadioValue)

																												if (RadioValue==true)
																													{
																														ValueOfElement=eval("document.aspnetForm." + ElementNameVal + ".value")
																														ValueOfElement=Q_No_Loop + "0";
																														
																													}
																											
																									}
																								else
																									{
																										ValueOfElement="D"
																									}
																								//alert("ValueOfElement=" + ValueOfElement)
																								if (ValueOfElement!="")
																									{
																										if (Str_Get_Answer=="")
																											{
																												Str_Get_Answer="" + ElementName + "^" + ValueOfElement + ""
																											}
																										else
																											{
																												Str_Get_Answer="" + Str_Get_Answer + "|" + ElementName + "^" + ValueOfElement + ""
																											}
																										//alert("Str_Get_Answer=" + Str_Get_Answer)
																									}		
																						}//else part of LenCheck=="undefined"
																					else
																						{
																								for (j=0; j<k; j++)
																									{	
																														ValueOfElement=""
																																Q_CheckDisable=eval("document.aspnetForm." + ElementNameVal + "[j].disabled")
																																//alert("Q_CheckDisable=" + Q_CheckDisable)	
																															if (Q_CheckDisable==false)
																																{
																																			RadioValue=eval("document.aspnetForm." + ElementNameVal + "[j].checked")
																																			//alert("RadioValue=" + RadioValue)

																																			if (RadioValue==true)
																																				{
																																					//ValueOfElement=eval("document.aspnetForm." + ElementNameVal + "[j].value")
																																					
																																					ValueOfElement=Q_No_Loop + "" + j + "";
																																				}
																																			
																																}
																															else
																																{
																																	ValueOfElement="D"
																																}
																														 //alert("ValueOfElement=" + ValueOfElement)
																														if (ValueOfElement!="")
																															{
																																if (Str_Get_Answer=="")
																																	{
																																		Str_Get_Answer="" + ElementName + "^" + ValueOfElement + ""
																																	}
																																else
																																	{
																																		Str_Get_Answer="" + Str_Get_Answer + "|" + ElementName + "^" + ValueOfElement + ""
																																	}
																																//alert("Str_Get_Answer=" + Str_Get_Answer)
																															}		
																									}//For loop
																						}//Ending of else part of LenCheck=="undefined"
																	}//Ending of "If" statement Name 
													
											
									}//Ending of a For Loop
									//alert("Str_Get_Answer_Final=" + Str_Get_Answer)
									//Get the J/W/T	
										RTS_JWT=eval("document.aspnetForm.RTS_JWT.value")
										//alert("RTS_JWT=" + RTS_JWT)
									//Get variable for saving the answers
										Name_Hidden_Var="RTS_Ans_" + RTS_JWT
										
										//alert("Str_Get_Answer=" + Str_Get_Answer)
									//Split the variable for saving the answers
										ArrayVariables = Name_Hidden_Var.split("|");
										Hidden_Variables=ArrayVariables[0].valueOf()
									//alert("Hidden_Variables=" + Hidden_Variables)
									eval("document.aspnetForm." + Hidden_Variables + ".value='" + Str_Get_Answer + "'")
									eval("document.aspnetForm.Var_Hidden_Ans.value='" + Str_Get_Answer + "'")
															
									AnswerSaveForProd =eval("document.aspnetForm." + Hidden_Variables + ".value")
									//alert("AnswerSaveForProd=" + AnswerSaveForProd)
				
}	
//Gets the answers back from the database 
function DisplayAnswersFromRTS()
{
	  
						 
					
					 
                         
                       
                           //document.getElementById('Response_text001').innerHTML =  
                        Answer_ForEach_JWT=eval("document.aspnetForm.Var_Hidden_Ans.value")
                     //   alert("Answer_ForEach_JWT=" + Answer_ForEach_JWT) 
                           
                           Display_Answers_Array=eval("document.aspnetForm.Display_Answers_Array.value")
                          //alert("Display_Answers_Array=" + Display_Answers_Array) 
                           
						if (Answer_ForEach_JWT!="") 
						{
												ArrayVar2 = Answer_ForEach_JWT.split("|");
												arraylength2 = ArrayVar2.length
												 //alert("arraylength2=" + arraylength2) 
												//arraylength=eval(arraylength-1)
												for (N = 0 ; N < arraylength2 ; N++ )
													{
																	Ele_Ans=ArrayVar2[N].valueOf()
																	 // alert("Ele_Ans=" + Ele_Ans)	
																	POS=Ele_Ans.indexOf("^")
																	Name=Ele_Ans.substring(0,7)
																	DisQ_no=Ele_Ans.substring(7,POS)
																	  //alert("DisQ_no=" + DisQ_no);
																	ElementName=Ele_Ans.substring(0,POS)
																	//alert("ElementName=" + ElementName);
																	ElementNameVal="ctl00$ContentPlaceHolder1$" + ElementName + ""; 
																 
																	//alert("Test1")
																	LastPOS = Ele_Ans.length
																	//alert("LastPOS=" + LastPOS);
																	POS2=eval(POS+1)
																	ANS_Value=Ele_Ans.substring(POS2,LastPOS)
																	//alert("ANS_Value=" + ANS_Value);
																	StrSpanNameRTS="rad_Span" + DisQ_no + "";
																	//return false;
																	if ((Name=="txt_num")||(Name=="txt_dat")||(Name=="txt_txt")||(Name=="txt_Dol")||(Name=="txt_Cen")||(Name=="txt_Fee")||(Name=="txt_Inc")||(Name=="txt_Hou")||(Name=="txt_Min"))	
																		{
																									if (ANS_Value=="D")
																										{
																											eval("document.aspnetForm." + ElementNameVal + ".disabled=true")
																											eval("document.aspnetForm." + ElementNameVal + ".style.backgroundColor = 'red'")
																											if (Name=="txt_txt")
				                                                                                            {																				
					                                                                                            strtxt="ctl00$ContentPlaceHolder1$Counter" + DisQ_no
					                                                                                            eval("document.aspnetForm." + strtxt + ".value=''")
					                                                                                            eval("document.aspnetForm." + strtxt + ".style.backgroundColor = 'red'")
				                                                                                            }			
																										}
																									else
																										{
																											eval("document.aspnetForm." + ElementNameVal + ".value='" + ANS_Value + "'")
																										}		
																		}
																	else
																		{
																		
																										k=eval("document.aspnetForm." + ElementNameVal + ".length")
																										 //alert("kV=" + k)	
																										LenCheck=String(k)
																										//alert("LenCheck=" + LenCheck)
																										 //alert("ANS_Value=" + ANS_Value)
																										if (LenCheck=="undefined")
																											{	
																													if (ANS_Value=="D")
																														{
																														    StrSpanRTS="" + StrSpanNameRTS + "0";
																															eval("document.aspnetForm." + ElementNameVal + ".disabled=true")
																															//eval("document.aspnetForm." + ElementNameVal + ".style.backgroundColor = 'red'")
																															eval("document.getElementById('" + StrSpanRTS + "').style.backgroundColor= 'red'") 
																														}
																													else
																														{
																																	//alert("j=" + j)
																																	RadioValue=eval("document.aspnetForm." + ElementNameVal + ".value")
																																	 RadioValue=DisQ_no + "0";
																																	// alert("RadioValue=" + RadioValue)
																																	if (RadioValue==ANS_Value)
																																		{
																																			//InPutValue=eval("document.aspnetForm." + Q_Value + "[j].value")
																																			eval("document.aspnetForm." + ElementNameVal + ".checked=true")
																																			//alert("set=" + InPutValue);	
																																		}
																														}
																													
																													
																											}//else part of LenCheck=="undefined"
																										else
																											{
																													for (A=0; A<k; A++)
																														{	
																															
																																			if (ANS_Value=="D")
																																					{
																																					    
                                                                                                                                                        StrSpanRTS="" + StrSpanNameRTS + "" + A + "";
                                                                                                                                                      // alert("StrSpanRTS=" + StrSpanRTS)
																																						eval("document.aspnetForm." + ElementNameVal + "[A].disabled=true")
																																						//eval("document.aspnetForm." + ElementNameVal + "[A].style.backgroundColor = 'red'")
																																						 eval("document.getElementById('" + StrSpanRTS + "').style.backgroundColor= 'red'")
																																					}
																																				else
																																					{
																																								//alert("j=" + j)
																																								RadioValue=eval("document.aspnetForm." + ElementNameVal + "[A].value")
																																								var End_Val = RadioValue.substring(ElementName.length, RadioValue.length);
																																								// alert("ElementNameVal=" + ElementNameVal);
																																								// RadioValue=DisQ_no + "" + A;
																																								RadioValue = DisQ_no + "" + End_Val;
																																								  //alert("RadioValue=" + RadioValue)
																																								 //alert("ANS_Value=" + ANS_Value); 
																																								 
																																								if (RadioValue==ANS_Value)
																																									{
																																										//InPutValue=eval("document.aspnetForm." + Q_Value + "[j].value")
																																										eval("document.aspnetForm." + ElementNameVal + "[A].checked=true")
																																										//alert("set=" + InPutValue);	
																																									}
																																					}
																														}//For loop
																											}//Ending of else part of LenCheck=="undefined"
																		
																		}//Ending Of N,M,P,H,T "IF" Statement
																		
													}//Ending of "N" For loop
													
							}//Ending of "IF" Answer_ForEach_JWT!=""
					
					
					    Display_Answers_Array=eval("document.aspnetForm.Display_Answers_Array.value")
                          // alert("Display_Answers_Array=" + Display_Answers_Array) 
                           
						if (Display_Answers_Array!="") 
						{
												ArrayDAns = Display_Answers_Array.split("|");
												ArrayDAnsLen = ArrayDAns.length
												  //alert("arraylength2=" + arraylength2) 
												//arraylength=eval(arraylength-1)
												for (v = 0 ; v < ArrayDAnsLen ; v++ )
													{
																	Dis_Ele_Ans=ArrayDAns[v].valueOf()
																	// alert("Dis_Ele_Ans=" + Dis_Ele_Ans)	
 																	Dis_SpanArray=Dis_Ele_Ans.split("_");
 																	Ele_Q_Val=Dis_SpanArray[0]
 																    Ele_Q_ans_txt=Dis_SpanArray[1]
                                                                   // alert("Ele_Q_Val=" + Ele_Q_Val);
                                                                  // alert("Ele_Q_ans_txt=" + Ele_Q_ans_txt);
                                                                    
                                                                     StrSpanAns="AnsResponse_" + Ele_Q_Val + "";
                                                                     // alert("StrSpanAns=" + StrSpanAns);
                                                                       
																  var IdExists= eval("document.getElementById('" + StrSpanAns + "')")
																  //alert("IdExists=" + IdExists);
                                                                    if (IdExists!=null)
                                                                    {
														                  
														                     eval("document.getElementById('" + StrSpanAns + "').innerHTML='" + Ele_Q_ans_txt + "'")
														            } 
                                                                    
                                                                    
//																	ElementName=Ele_Ans.substring(0,POS)
												    }	
						}//ending if (Display_Answers_Array!="") 	
				 
}
function EnterText(CounterBoxName,TextBoxName)
{
		//alert("TextBoxName=" + TextBoxName);
		TextLen=eval("document.aspnetForm." + TextBoxName + ".value.length")
		//alert("TextLen=" + TextLen);
		//document.aspnetForm." + CounterBoxName + ".value=TextLen
		eval("document.aspnetForm." + CounterBoxName + ".value=TextLen")
}
function PrintPage(text)
{
text=document
print(text)
return false;
}
 function checkNumber(val) 
 {
 //alert("val=" + val);
 
 ILang_Id=document.aspnetForm.ILang_Id.value	
  var strLength = val.length;
  //alert("strLength=" + strLength);
  	for (w=0; w<strLength; w++)
	 {
	    	   //alert("w=" + w);
	    	   Valnum = val.charAt(w);
	    	   // alert("Valnum=" + Valnum);
	    	  var cCode = CalcKeyCode(Valnum);
              // alert("code=" + cCode);
              //if (cCode < 48 || cCode > 57 ) 
              if (ILang_Id=="10") 
              {
                   if (cCode==47) 
                      {
                       return false;
                      }
                   if (cCode < 46 || cCode > 57 ) 
                      {
                        // alert("What");
                       return false;
                      }
               }
               else
               {
                     if (cCode < 48 || cCode > 57 ) 
                      {
                        // alert("What");
                       return false;
                      }
               }
     }  
}
function CalcKeyCode(aChar) 
{
  var code = aChar.charCodeAt(0);
  return code;
}
function NumberOnly(evt)
{
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;
   //alert("charCode=" + charCode);
    //***** charCode=13 is Enter key
    ILang_Id=document.aspnetForm.ILang_Id.value	
    
    if (charCode==13)
	{
		return false;
    }
    if (ILang_Id=="10") 
    {
                if (charCode==47)
	            {
		            return false;
                }
                             
	            if (charCode > 31 && (charCode < 46 || charCode > 57))
	            {
		            return false;
                }
    }
    else
    {
             if (charCode > 31 && (charCode < 48 || charCode > 57))
	            {
		            return false;
                }
    }
	return true;
}

 function DatecheckNumber(val) 
 {
 //alert("val=" + val);
  
  var strLength = val.length;
  //alert("strLength=" + strLength);
  	for (w=0; w<strLength; w++)
	 {
	    	   //alert("w=" + w);
	    	   Valnum = val.charAt(w);
	    	    //alert("Valnum=" + Valnum);
	    	  var cCode = CalcKeyCode(Valnum);
             //alert("code=" + cCode);
              if (cCode < 44 || cCode > 57 ) 
                  {
                   // break;
                   // alert("wrong");
                   return false;
                  }
             //alert("What=" + Valnum);
     }  
}
function DateNumberOnly(evt)
{
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;
   //alert("charCode=" + charCode);
    //***** charCode=13 is Enter key
    if (charCode==13)
	{
		return false;
    }
                       
	if (charCode > 31 && (charCode < 44 || charCode > 57))
	{
		return false;
    }
	return true;
}

//if (ILang_Id=="10") 
// ILang_Id=document.aspnetForm.ILang_Id.value																								 


</script>
<hr color="dodgerblue">

<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table3" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
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
            
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue">
<SPAN  id="ShowDetail">
    <%=DisplayJWTInfo%>
</SPAN>
<table border="0" cellPadding="1" cellSpacing="1" width="100%">
	<TR>		
		<TD align="left" class="selectionCriteriaItem">	
			<input type="checkbox" name="showCheck"  checked  onclick="GetDetail()"/><%=ShowJWTCheckboxText%>																		   
		</TD>	
	</TR>
</TABLE>
 
<asp:Table ID="Table1" runat="server" BorderWidth="1" Width="100%" >
<asp:TableRow>
    <asp:TableCell  BorderWidth="1" Width="90%"  BackColor="#336699" CssClass="reportTableHeader" HorizontalAlign="Center"  BorderColor="dodgerblue">
    <asp:Label ID="Label6" runat="server" Text="Questions"  CssClass="reportTableHeader"></asp:Label>     
                
    </asp:TableCell>
     <asp:TableCell  BorderWidth="1" Width="10%"  BackColor="#336699" CssClass="reportTableHeader" HorizontalAlign="Center"  BorderColor="dodgerblue">
   <asp:Button OnClientClick="return PrintPage()" ID="Button2" runat="server" Text="Print" CssClass="Button" ></asp:Button>
    </asp:TableCell>
</asp:TableRow>
 </asp:Table> 
 <asp:Table ID="QuestionTable" BorderWidth="1" Width="100%"  BorderColor="dodgerblue" runat="server">
 </asp:Table> 
   
<input name="InformationDisplay" type="hidden" value="" />


 <br />
    <br />
    <center>
    <asp:Label  ID="WarningMessage" runat="server"  Font-Bold="true" ForeColor="Red" SkinID="LabelBlackSkin" ></asp:Label>
    </center>
    <br />
    <br />
	
<input name="DisplayJWTInfo" type="hidden" value="<%=DisplayJWTInfo%>" />	
<input name="JWTInfoRTS" type="hidden" value="<%=JWTInfoRTS%>" />	
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="<%=Visit_Date%>" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />


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


<input name="Procedure_JWT_VisitDate_Check" type="hidden" value="<%=Procedure_JWT_VisitDate_Check%>"  />
<input name="Procedure_FunDate_Format" type="hidden" value="<%=Procedure_FunDate_Format%>"  />
<input name="Procedure_CalVisit_Time" type="hidden" value="<%=Procedure_CalVisit_Time%>"  />
<input name="Procedure_CFJWTQuestion" type="hidden" value="<%=Procedure_CFJWTQuestion%>"  />
<input name="Procedure_CFRTS_Issue" type="hidden" value="<%=Procedure_CFRTS_Issue%>"  />
 

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
<input name="ILang_Id" type="hidden" value="<%=Lang_id%>"/>

<input name="Star_time" type="hidden" value="<%=Star_time%>"/>
<%//From page CFCallFormInputs.aspx %>

<input name="DateRule" type="hidden" value="<%=DateRule%>"/>
<input name="Decimal_Point" type="hidden" value="<%=Decimal_Point%>"/>
<input name="MeasurementValue" type="hidden" value="<%=MeasurementValue%>"/>
<input name="CallForm_Elements" type="hidden" value="<%=All_ElementName%>"/>
<input name="ArrayAllHtmlElement" type="hidden" value="<%=ArrayAllHtmlElement%>"/>
<input name="ArrayAllQuestionsElement" type="hidden" value="<%=ArrayAllQuestionsElement%>"/>
<input name="ArrayEleSubmit" type="hidden" value="<%=ArrayEleSubmit%>"/>
<input name="All_EleAns_Val" type="hidden" value="<%=All_EleAns_Val%>"/>
<input name="CallFormAnswers" type="hidden" value=""/>
<input name="ArrayEleSubmitRTS" type="hidden" value="<%=ArrayEleSubmitRTS%>"/>

<%//For RTS%>
<input name="Client_id" type="hidden" value="0"/>
<input name="RTS_JWT_For" type="hidden" value="<%=STR_RTS_JWT%>"/>
<input name="RTS_JWT" type="hidden" value="<%=STR_RTS_JWT%>"/>
<input name="RTS_Ans_<%=STR_RTS_JWT%>" type="hidden" value="<%=Str_Back_RTSAnswers%>"/>
<input name="RTS_Ans_Save" type="hidden" value=""/>
<input type="hidden" name="Issue_Questions" value="<%=ArrayRTS_Q_no%>"/>
<input name="Here_RTS_Issue" type="hidden" value=""/>
<input name="RTS_Issue_Q_no" type="hidden" value=""/>
<input name="Call_Type" type="hidden" value="NEW"/>
<input name="IssueCategory" type="hidden" value="2"/>
<input name="group" type="hidden" value="2"/>
<input name="source" type="hidden" value="4"/>

 
<input name="CF_ILang_Id" type="hidden" value="<%=Lang_id%>"/>
<input name="ShortCallForm" type="hidden" value="<%=ShortCallForm%>" id="Hidden1"/>
<input name="Used_qty" type="hidden" value="<%=Used_qty%>" id="Hidden2"/>
<input name="Date_input" type="hidden" value="<%=Date_input%>" id="Hidden3"/>
<input name="user_id" type="hidden" value="<%=user_id%>" id="Hidden4"/>
<input name="CheckTo_Erase_Answers" type="hidden" value=""/>
<input name="Var_Hidden_Ans" id="Var_Hidden_Ans" type="hidden" value="<%=Reported_Answers_Array%>" />
<input name="Display_Answers_Array" id="Display_Answers_Array" type="hidden" value="<%=Display_Answers_Array%>" />
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>

<input name="CallForm_RTS_Path" type="hidden" value="<%=Current_URL%>"/>

<input name="RTS_Url" type="hidden" value="<%=RTS_Url%>"/>
<Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />

<br />
<br />
<center>
<%
    if (No_Question_avaliable == "0")
    {
            if (CheckErrorMessage != "N")
            {   
            %>
              <br />
              <strong><font color="Red" size="3"><%=CheckErrorMessage%></font></strong>
               <br />
            <%
            }
            else
            {    
            %>   
              <br />
              <strong><font color="Red" size="3">There are no responses reported for this visit.</font></strong>
               <br />
            <%
            }
            %>   
            <br />
            <asp:Button   OnClientClick="return Back_click()" ID="Button1" runat="server" Text="&lt;&lt; Back" CssClass="Button"></asp:Button>	
            <%
    }
    else
    {    
            %>
             
            <asp:Button OnClientClick="return CallFormSubmit(this.form)" ID="Update" runat="server" Text="Save" CssClass="Button"></asp:Button>

            <%
    }
%>

<br />
</center>
<input name="CallFormEnd"  id="CallFormEnd" type="hidden" value="0"/>
</asp:Content>

