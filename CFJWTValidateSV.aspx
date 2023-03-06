<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CFJWTValidateSV.aspx.cs" EnableViewStateMac="false" Inherits="CFJWTValidateSV" Title="SPAR - Internet Call Form Input" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%=JWTInfoText%>
<center>
 

<script type="text/javascript"  language="javascript">


//window.onloadstart  = DisableWindow;

//function DisableWindow()
//	{ 
//	    alert("test");
//	}
//	
 function CheckGoBack(e) 
 {
           
        TxtReadOnlyMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.readOnly;
       // alert("TxtReadOnlyMonth=" + TxtReadOnlyMonth);
    
        TxtReadOnlyDay=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.readOnly;
       // alert("TxtReadOnlyDay=" + TxtReadOnlyDay);
        
         TxtReadOnlyYear=document.aspnetForm.ctl00_ContentPlaceHolder1_txt_visityear.readOnly;
      //  alert("TxtReadOnlyYear=" + TxtReadOnlyYear);
      
       TxtReadOnlyTI_Hrs=document.aspnetForm.ctl00_ContentPlaceHolder1_txt_timein_hrs.readOnly;
       TxtReadOnlyTI_Min=document.aspnetForm.ctl00_ContentPlaceHolder1_txt_timein_min.readOnly;
       TxtReadOnlyTO_Hrs=document.aspnetForm.ctl00_ContentPlaceHolder1_txt_timeout_hrs.readOnly;
       TxtReadOnlyTO_min=document.aspnetForm.ctl00_ContentPlaceHolder1_txt_timeout_min.readOnly;
         
       
                        
                        
        var evt = e || window.event; 
        var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
       // alert("evt=" + node.name);
        var keyCode = evt.charCode || evt.keyCode; 
         //alert("keyCode=" + keyCode);
         if (TxtReadOnlyMonth==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_visitmonth"))  
                     {
                        return false;
                     }
         }
          if (TxtReadOnlyDay==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_visitday"))  
                     {
                        return false;
                     }
         }
          if (TxtReadOnlyYear==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_visityear"))  
                     {
                        return false;
                     }
         }
         //Time in and out
          if (TxtReadOnlyTI_Hrs==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_timein_hrs"))  
                     {
                        return false;
                     }
         }
          if (TxtReadOnlyTI_Min==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_timein_min"))  
                     {
                        return false;
                     }
         }
          if (TxtReadOnlyTO_Hrs==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_timeout_hrs"))  
                     {
                        return false;
                     }
         }
          if (TxtReadOnlyTO_min==true)
         {
                 if ((keyCode==8) && (node.name=="ctl00$ContentPlaceHolder1$txt_timeout_min"))  
                     {
                        return false;
                     }
         }

 }

  document.onkeydown = CheckGoBack;
 
function Load()
	{
	    // alert("test2");
	    	Bus_Rule22_Photo=document.aspnetForm.Bus_Rule22_Photo.value
		  //  alert("Bus_Rule22_Photo=" + Bus_Rule22_Photo);
//		    if (Bus_Rule22_Photo=="Y")
//		        {
//		                document.aspnetForm.action = "CFPictureGetFileOption.aspx";
//	                    document.aspnetForm.submit();
//	                    return false;	 
//		        }
//		    
	   // alert("test");
	}
function refresh()
	{
	   document.aspnetForm.Excute_SQL.value=false
	   document.aspnetForm.action = "CFJWTValidateSV.aspx";
	   document.aspnetForm.submit();
	   return false;	
	}
function RefreshOOS()
	{
       // alert("here");
	    OutofStocks_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$OutofStocksQuestion[0].checked;
	    OutofStocks_No=document.aspnetForm.ctl00$ContentPlaceHolder1$OutofStocksQuestion[1].checked;  
	      //alert("OutofStocks_Yes=" + OutofStocks_Yes);
	   //alert("OutofStocks_No=" + OutofStocks_No);
	   
	    if ((OutofStocks_Yes==false) && (OutofStocks_No==false))
		{
			//alert("Please answer the question: \n Do you have OOS to report for this job/wave/task?");
			alert('<%=vPrompts[61]%>');
			return false;
		}
		 //if (Radio_EShelf_Yes==True)
	  
	   if (OutofStocks_Yes==true)
	   {
					
					alert('<%=vPrompts[62]%>');
					document.aspnetForm.action = "CFJWTInputs.aspx";
					document.aspnetForm.submit();
					return false;		  	
	   }
	   if (OutofStocks_No==true)
	   {
					
					document.aspnetForm.OutOfStock_no.value=1
				    document.aspnetForm.action = "CFJWTValidateSV.aspx";
				    document.aspnetForm.submit();
				    return false;
	   }
	}
	
	function DisableButtons()
	{
	          //******* Disabled the buttons
	         
            
             
             //*********** Button2 is NEXT
	        var NEXTExists=document.getElementById("ctl00_ContentPlaceHolder1_Button2");
            if (NEXTExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;  
            }
            //********** Submit is Photo Upload 
            var PhotoExists=document.getElementById("ctl00_ContentPlaceHolder1_Submit");
            if (PhotoExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=true; 
            }
            var PhotoExists1=document.getElementById("ctl00_ContentPlaceHolder1_Submit2");
            if (PhotoExists1!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit2.disabled=true; 
            }
            
           //********* Back Button  
            var Exists4=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
            if (Exists4!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=true; 
            }
            
            var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_Button6");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=true; 
            }
            
            var Exists7=document.getElementById("ctl00_ContentPlaceHolder1_Button7");
            if (Exists7!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=true; 
            }
            
            var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_Button3");
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=true; 
            }
	        //document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=true;
	}
	function AbleButtons()
	{
	     //******* Disabled the buttons
		//document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=false;
	    //document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;
	    //document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=false;
	      //*********** Button2 is NEXT
	        var NEXTExists=document.getElementById("ctl00_ContentPlaceHolder1_Button2");
            if (NEXTExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;  
            }
            //********** Submit is Photo Upload 
            var PhotoExists=document.getElementById("ctl00_ContentPlaceHolder1_Submit");
            if (PhotoExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=false; 
            }
            var PhotoExists1=document.getElementById("ctl00_ContentPlaceHolder1_Submit2");
            if (PhotoExists1!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit2.disabled=false; 
            }
            
           //********* Back Button  
            var Exists4=document.getElementById("ctl00_ContentPlaceHolder1_Button4");
            if (Exists4!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button4.disabled=false; 
            }
            
            var Exists6=document.getElementById("ctl00_ContentPlaceHolder1_Button6");
            if (Exists6!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=false; 
            }
            
            var Exists7=document.getElementById("ctl00_ContentPlaceHolder1_Button7");
            if (Exists7!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=false; 
            }
            
            var Exists3=document.getElementById("ctl00_ContentPlaceHolder1_Button3");
            if (Exists3!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=false; 
            }
	        //document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=true;
	}
		
function DoSubmit()
	{
	    
	    DisableButtons()

		nightvisit=document.aspnetForm.night_visits.value
		 //alert("nightvisit=" + nightvisit);
		
		overwritetime=document.aspnetForm.overwritetime.value
		//alert("overwritetime=" + overwritetime);
		
		asktravel=document.aspnetForm.Travel_flag.value
		//alert("asktravel=" + asktravel);
		
		askmileage=document.aspnetForm.Mileage_flag.value
		//alert("askmileage=" + askmileage);
		
		asktime=document.aspnetForm.Collect_iVR_Time.value
		//alert("asktime=" + asktime);
		
		Ask_Q_HH_Used=document.aspnetForm.Ask_Q_HH_Used.value
		//alert("Ask_Q_HH_Used=" + Ask_Q_HH_Used);
		
		Ret_store_visit=document.aspnetForm.Ret_store_visit.value
		 //alert("Ret_store_visit=" + Ret_store_visit);
		DateRule=document.aspnetForm.DateFormat.value
	    //alert("DateRule=" + DateRule);
	    
		//************* Visit date ************************
	 
		if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value==""))
		 {
			alert('<%=vPrompts[59]%>'); 
			AbleButtons()
			return false;
		 }
		else
		 {
						var	delimiter,date_format,JEdate,i, CorrectDate
		
						var result=true;
		
						CorrectDate="";
						delimiter="";
						date_format = DateRule;
						POS_Dot=date_format.indexOf(".")	
						if (POS_Dot>0)
						{
							delimiter="."
						}
						POS_Back_slash=date_format.indexOf("/")	
						if (POS_Back_slash>0)
						{
							delimiter="/"
						}
						POS_Dash=date_format.indexOf("-")	
						if (POS_Dash>0)
						{
							delimiter="-"
						}
						JEdate = date_format.split(delimiter);
						
						
						
						
						for(i=0; i<JEdate.length; i++)
							{
										if (JEdate[i] == "mm")
										{
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
										}
										if (JEdate[i] == "dd")
										{
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
										}
										if (JEdate[i] == "yyyy" || JEdate[i] == "yy" )
										{
											CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
										}
									if (i<2) 
										{
											CorrectDate=CorrectDate + "" + delimiter + "";
										}
							}                // end of for 
	                        
	                        StrMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
	                        StrDay=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
	                        StrYear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
	                        
							 //alert("CorrectDate=" + CorrectDate);
							// put the value in a hidden variable 
							document.aspnetForm.Hidden_date.value=CorrectDate;
							// pass the value to our multilanguage Function
							sys_rule=DateRule
							//alert("year=" +document.TimeValidation.txt_visityear.value);
							//alert("sys_rule=" + sys_rule);
							 StrDateCheck=StrMonth + "" + StrDay + "" + StrYear;  
//			                 if (DatecheckNumber(StrDateCheck)==false)
//						            {
//						                 //alert("check");
//						                alert('<%=vPrompts[59]%>');
//						                AbleButtons()
//                                        return false;
//						            }     
//							if (DateValidation(CorrectDate,sys_rule,'<%=vPrompts[59]%>')==false)
//							 {
//							    AbleButtons()
//								return false;
//							 }
			}
			if (result==false)	
			{
				return result;
			}
		    //***** Assign date to hidden variables
		    Str_VisitMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
            Str_visitday=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
            Str_visityear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
            
		     document.aspnetForm.Str_VisitMonth.value=Str_VisitMonth;
             document.aspnetForm.Str_visitday.value=Str_visitday;
             document.aspnetForm.Str_visityear.value=Str_visityear;
             //************** Check the date from the grid 
             
//            if (GridDateCheck(CorrectDate)==false)
//			 {
//			    AbleButtons()
//				return false;
//			 }
		    //alert("Str_VisitMonth=" + Str_VisitMonth);
		   // alert("Str_visitday=" + Str_visitday);
		   // alert("Str_visityear=" + Str_visityear);
		    
		//************* Time In/Out ************************
		
		if (asktime=="Y") 
			{
			        HourRule=document.aspnetForm.HourRule.value
			        //alert("HourRule=" + HourRule);
			         
			     if (HourRule=="24")  
                    {
                         //alert("24");
                            if (Valdation_24hour() == false) 
                             {
                                 return false;
                             }
                     }
                  else
                      {
                       // alert("12");
                         if (Valdation_12hour() == false) 
                         {
                             return false;
                         }
                      }
			}
			
		if (askmileage=="Y") 
			{
					MileageBox=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_mileage.value
				    MileageBox=Trim(MileageBox)
			
				if ((MileageBox=="") || (isNaN(MileageBox)) || (Number(MileageBox)<0))
					{
						//alert("Please enter valid mileage");
						alert('<%=vPrompts[51]%>');
						AbleButtons()
						return false;
					}
					
				CheckDot=MileageBox.indexOf(".") 
				if (CheckDot>0)
					{
						MileValue=MileageBox.substring(0,CheckDot)
						 //alert("MileValue=" + MileValue);
						 if (MileValue>9999)
							{
								alert('<%=vPrompts[51]%>');
								AbleButtons()
								return false;
							}
						 POS2=MileageBox.length
						 MileValue2=MileageBox.substring(CheckDot+1,POS2)
						 //alert("MileValue2=" + MileValue2);
						 if (MileValue2>99)
							{
								alert('<%=vPrompts[51]%>');
								AbleButtons()
								return false;
							}
					}
				else
					{
						 if (MileageBox>9999)
							{
								alert('<%=vPrompts[51]%>');
								AbleButtons()
								return false;
							}
						
					}	
					
				//alert("CheckDot=" + CheckDot)
				 // alert("MileageBox=" + MileageBox); 
				 document.aspnetForm.Str_txt_mileage.value=MileageBox;
				//BoxLen=textBoxValue.length
			}
		 if (Ret_store_visit=="Y")
		 {
		    rad_q_Ret_store_visit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[0].checked;
		 }
		 else
		 {
		    rad_q_Ret_store_visit_Yes=false;
		 }
		   
           //alert("rad_q_Ret_store_visit_Yes=" + rad_q_Ret_store_visit_Yes);     
		 Collect_Store_Mgr_Name=document.aspnetForm.Collect_Store_Mgr_Name.value;
		 //alert("Collect_Store_Mgr_Name=" + Collect_Store_Mgr_Name);   
		if (Collect_Store_Mgr_Name=="Y")
		    {
		       str_Manager_name=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.value;
		       //alert("str_Manager_name=" + str_Manager_name); 
		       str_Manager_name=Trim(str_Manager_name)
		       if (str_Manager_name=="")
		       {        
		                if (rad_q_Ret_store_visit_Yes==false)
                            {
		                	        alert('<%=vPrompts[71]%>');
		                	        AbleButtons()
							        return false;
							}
						
		       }
		       if (rad_q_Ret_store_visit_Yes==true)
                {
            	     //document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.readonly='true';
            	     document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.value=''; 
            	     str_Manager_name='';
				}
					//alert("str_Manager_name=" + str_Manager_name); 		
		       document.aspnetForm.Str_Manager_Title.value=document.aspnetForm.ctl00$ContentPlaceHolder1$Manager_Title.value;
		       document.aspnetForm.Str_txt_Manager_name.value=str_Manager_name;
		    }
		 
		if (asktravel=="Y") 
			{
				if ((Trim(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_drive.value)=="") || (isNaN(document.aspnetForm.ctl00$ContentPlaceHolder1$txt_drive.value)))
					{
						//alert("Please enter a valid drive time");
						alert('<%=vPrompts[52]%>');
						AbleButtons()
						return false;
					}
					Strtxt_drive=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_drive.value
					
			     document.aspnetForm.Str_txt_drive.value=Strtxt_drive;	
			    // alert("Strtxt_drive=" + Strtxt_drive); 	
			}
			
			if ((askmileage=="Y") && (asktravel=="Y"))
            {
                            Drive_Time=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_drive.value;
                            Drive_Time=Trim(Drive_Time)
                           // alert("Drive_Time=" + Drive_Time);
                           MileageBox=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_mileage.value;
                           MileageBox=Trim(MileageBox)
		                    //MileageBox=document.frm_validation.txt_mileage.value
	                    if ((MileageBox==0) && (Drive_Time>0))
	                    {
	                        //alert("You can not have a value bigger zero for drive time if visit miles is zero.");
	                        alert('<%=vPrompts[77]%>');
	                        AbleButtons()
	                        return false;
	                    }	
	                      if ((MileageBox>0) && (Drive_Time==0))
	                    {
	                        //alert("You can not have a value bigger zero for visit miles if drive time is zero.");
	                         alert('<%=vPrompts[78]%>');
	                         AbleButtons()
	                        return false;
	                    }	
	                    
            }
            
		var rad_q_HH_Used_Yes,rad_q_Ret_store_visit_Yes 	
		rad_q_HH_Used_Yes=false
		rad_q_Ret_store_visit_Yes=false
		if (Ask_Q_HH_Used=="Y")
			{
				rad_q_HH_Used_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_HH_Used[0].checked;
				rad_q_HH_Used_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_HH_Used[1].checked;    
				if ((rad_q_HH_Used_Yes==false) && (rad_q_HH_Used_No==false))
					{
						//alert("Please answer the question: \n Did you use your HandHeld Unit?");
						alert('<%=vPrompts[53]%>');
						AbleButtons()
						return false;
					}
			} 
		if (Ret_store_visit=="Y")
					{
						rad_q_Ret_store_visit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[0].checked;
						rad_q_Ret_store_visit_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[1].checked;    
						if ((rad_q_Ret_store_visit_Yes==false) && (rad_q_Ret_store_visit_No==false))
							{
								//alert("Please answer the question: \n Do you have to return to the store to complete the Store Visit? ");
								alert('<%=vPrompts[54]%>');
								AbleButtons()
								return false;
							}
						
					} 

				Ask_EShelf_Question=document.aspnetForm.Ask_EShelf_Question.value
				//alert("Ask_EShelf_Question=" + Ask_EShelf_Question);
				if (Ask_EShelf_Question=="Y")
				{
					Radio_EShelf_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$Radio_EShelf[0].checked;
					Radio_EShelf_No=document.aspnetForm.ctl00$ContentPlaceHolder1$Radio_EShelf[1].checked;    
					if ((Radio_EShelf_Yes==false) && (Radio_EShelf_No==false))
						{
							//alert("Please answer the question: \n Have you reported your EShelf information?");
					 
							alert('<%=vPrompts[60]%>');
							AbleButtons()
							return false;
						}
					if ((Radio_EShelf_No==true))
						{
						    document.aspnetForm.action = "http://ny.sparinc.com/eShelf.asp";
		                    document.aspnetForm.submit();
		                    return false;	
						}
				} 
		//For business rule questions 
				
				
				Bus_Rule3_Question=document.aspnetForm.Bus_Rule3_Question.value
				//alert("Bus_Rule5_Question=" + Bus_Rule5_Question);
				if (Bus_Rule3_Question=="Y")
					{
						rad_q_BR3_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR3[0].checked;
						rad_q_BR3_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR3[1].checked;    
						if ((rad_q_BR3_Yes==false) && (rad_q_BR3_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[66]%>');
								AbleButtons()
								return false;
							}
						 if (rad_q_BR3_Yes==true) 	
						 {
						    alert('<%=vPrompts[73]%>');
						    document.aspnetForm.action = "CFJWTInputs.aspx";
		                    document.aspnetForm.submit();
						    return false;
						 }
					} 
				Bus_Rule4_Question=document.aspnetForm.Bus_Rule4_Question.value
				//alert("Bus_Rule5_Question=" + Bus_Rule5_Question);
				if (Bus_Rule4_Question=="Y")
					{
						rad_q_BR4_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR4[0].checked;
						rad_q_BR4_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR4[1].checked;    
						if ((rad_q_BR4_Yes==false) && (rad_q_BR4_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[67]%>');
								AbleButtons()
								return false;
							}
						 if (rad_q_BR4_Yes==true) 	
						 {
						    alert('<%=vPrompts[73]%>');
						    document.aspnetForm.action = "CFJWTInputs.aspx";
		                    document.aspnetForm.submit();
						    return false;
						 }
							
							 
					} 
				Bus_Rule5_Question=document.aspnetForm.Bus_Rule5_Question.value
				//alert("Bus_Rule5_Question=" + Bus_Rule5_Question);
				if (Bus_Rule5_Question=="Y")
					{
						rad_q_BR5_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR5[0].checked;
						rad_q_BR5_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR5[1].checked;    
						if ((rad_q_BR5_Yes==false) && (rad_q_BR5_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[63]%>');
								AbleButtons()
								return false;
							}
						 if (rad_q_BR5_Yes==true) 	
						 {
						    alert('<%=vPrompts[73]%>');
						    document.aspnetForm.action = "CFJWTInputs.aspx";
		                    document.aspnetForm.submit();
						    return false;
						 }
					} 
				Bus_Rule6_Question=document.aspnetForm.Bus_Rule6_Question.value
				//alert("Bus_Rule6_Question=" + Bus_Rule6_Question);
				if (Bus_Rule6_Question=="Y")
					{
						rad_q_BR6_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR6[0].checked;
						rad_q_BR6_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR6[1].checked;    
						if ((rad_q_BR6_Yes==false) && (rad_q_BR6_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[64]%>');
								AbleButtons()
								return false;
							}
						 if (rad_q_BR6_Yes==true) 	
						 {
						    alert('<%=vPrompts[73]%>');
						    document.aspnetForm.action = "CFJWTInputs.aspx";
		                    document.aspnetForm.submit();
						    return false;
						 }
					} 
				Bus_Rule7_Question=document.aspnetForm.Bus_Rule7_Question.value
				//alert("Bus_Rule5_Question=" + Bus_Rule5_Question);
				if (Bus_Rule7_Question=="Y")
					{
						rad_q_BR7_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR7[0].checked;
						rad_q_BR7_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR7[1].checked;    
						if ((rad_q_BR7_Yes==false) && (rad_q_BR7_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[68]%>');
								AbleButtons()
								return false;
							}
					} 
				Bus_Rule28_Question=document.aspnetForm.Bus_Rule28_Question.value
				//alert("Bus_Rule28_Question=" + Bus_Rule28_Question);
				if (Bus_Rule28_Question=="Y")
					{
						rad_q_BR28_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR28[0].checked;
						rad_q_BR28_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_BR28[1].checked;    
						if ((rad_q_BR28_Yes==false) && (rad_q_BR28_No==false))
							{
								//alert("Please answer the question: \n Did you use your HandHeld Unit?");
								alert('<%=vPrompts[65]%>');
								AbleButtons()
								return false;
							}
						if (rad_q_BR28_Yes==true) 	
						 {
						    alert('<%=vPrompts[73]%>');
						    document.aspnetForm.action = "CFJWTInputs.aspx";
		                    document.aspnetForm.submit();
						    return false;
						 }
					} 
		//********************* direction of the call form	
		Collect_Call_Form=document.aspnetForm.Collect_Call_Form.value;
		Call_Form_Type_No=document.aspnetForm.Call_Form_Type_No.value;
		
        //alert("Collect_Call_Form=" + Collect_Call_Form);
        //alert("overwritetime=" + overwritetime);
        //alert("rad_q_Ret_store_visit_Yes=" + rad_q_Ret_store_visit_Yes);
        //alert("rad_q_HH_Used_Yes=" + rad_q_HH_Used_Yes);
        //alert("Call_Form_Type_No=" + Call_Form_Type_No);
		//return false;	
		//******* Disabled the buttons
		//document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=true;
	    //document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;
	    //document.aspnetForm.ctl00$ContentPlaceHolder1$Button3.disabled=true;
	    	
	    	
	    CFD_VisitDate_Edit=document.aspnetForm.CFD_VisitDate_Edit.value;
	    //alert("CFD_VisitDate_Edit=" + CFD_VisitDate_Edit);
	    if (CFD_VisitDate_Edit=="Y")
	    {
	            UpdateCallVisitDataFlagStatus()
	    }
	    CheckModify_CallVisit_Flag=document.aspnetForm.Modify_CallVisit_Flag.value;
	  // alert("CheckModify_CallVisit_Flag=" + CheckModify_CallVisit_Flag);	
	    	
		if ((overwritetime=="Y")||(rad_q_HH_Used_Yes==true) || (rad_q_Ret_store_visit_Yes==true) || (Collect_Call_Form=="NO")||(CFD_VisitDate_Edit=="Y"))
		{
		            //alert("CFConfirmation");
		            document.aspnetForm.action = "CFConfirmation.aspx";
		            document.aspnetForm.submit();
		            return false;	
		} 
		else
		{
		            if (Collect_Call_Form=="YES")
		                {
		                        if (Call_Form_Type_No=="2")
		                            {
		                                    //alert("CFGrid");95039,99999
		                                      Merch_no=document.aspnetForm.Str_Merch_no.value;
		                                      
	                                          //alert("Merch_no=" + Merch_no);
	                                         //if ((Merch_no=="99999")||(Merch_no=="95039")) 
	                                         //{
		                                        document.aspnetForm.action = "CFProductCallForm.aspx";
		                                     //}
		                                    // else
		                                    // {
		                                    //    document.aspnetForm.action ="http://mi21.sparinc.com/CallForm/CFGrid.asp";
		                                    // }
		                                    document.aspnetForm.submit();
		                                    return false;	
		                            }
		                            
		                         if (Call_Form_Type_No=="5")
		                            {       
		                                     Merch_no=document.aspnetForm.Str_Merch_no.value;
		                                     document.aspnetForm.action = "CFProductCallForm.aspx";
		                                     document.aspnetForm.submit();
		                                     return false;
		                            }
		                          if (Call_Form_Type_No!="2")
		                            {
		                                     //alert("CFCallformInputs");
		                                    document.aspnetForm.action = "CFCallformInputs.aspx";
		                                    document.aspnetForm.submit();
		                                    return false;
		                            }
		                }//end of if (Collect_Call_Form=="YES")
		
		
		}
		
			//alert("CFTimeValidate");	
		document.aspnetForm.action = "CFTimeValidate.aspx";
		document.aspnetForm.submit();
		return false;	
	}
	
	
	function UpdateCallVisitDataFlagStatus()
{

        Org_asktravel=document.aspnetForm.Travel_flag.value
		// alert("Org_asktravel=" + Org_asktravel);
		
		Org_askmileage=document.aspnetForm.Mileage_flag.value
		// alert("Org_askmileage=" + Org_askmileage);
		
		Org_asktime=document.aspnetForm.Collect_iVR_Time.value
		// alert("Org_asktime=" + Org_asktime);
		
		  StrModify_CallVisit_Flag="N";
 //*********************DataBase Values
 
 
            //Visit Date
          
                Org_VisitMonth=document.aspnetForm.Org_VisitMonth.value;  
                Org_visitday =document.aspnetForm.Org_visitday.value; 
                Org_visityear=document.aspnetForm.Org_visityear.value;
                
                Ent_VisitMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value; 
                Ent_visitday=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value; 
                Ent_visityear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value; 
                
                if (Org_VisitMonth!=Ent_VisitMonth)
                {
                        StrModify_CallVisit_Flag="Y";
                }
                if (Org_visitday!=Ent_visitday)
                {
                        StrModify_CallVisit_Flag="Y";
                }
                if (Org_visityear!=Ent_visityear)
                {
                        StrModify_CallVisit_Flag="Y";
                }
             
             if (asktime=="Y") 
			{      
                    //Time In  
                        Org_timein_hrs=document.aspnetForm.Org_timein_hrs.value; 
                        // alert("Org_timein_hrs=" + Org_timein_hrs)  
                        Org_timein_min=document.aspnetForm.Org_timein_min.value;  
                       //  alert("Org_timein_min=" + Org_timein_min) 
                        Org_cmb_timein=document.aspnetForm.Org_cmb_timein.value;
                       //  alert("Org_cmb_timein=" + Org_cmb_timein)
                    //Time Out       
                        Org_timeout_hrs=document.aspnetForm.Org_timeout_hrs.value; 
                       // alert("Org_timeout_hrs=" + Org_timeout_hrs)  
                        Org_timeout_min=document.aspnetForm.Org_timeout_min.value;   
                       // alert("Org_timeout_min=" + Org_timeout_min)
                        Org_cmb_timeout=document.aspnetForm.Org_cmb_timeout.value; 
                       // alert("Org_cmb_timeout=" + Org_cmb_timeout)
                  
                   
                     //Time In       
                        Ent_timein_hrs=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_hrs.value;
				        Ent_Time_In_Hour=Trim(Time_In_Hour) 
				         //alert("Ent_Time_In_Hour=" + Ent_Time_In_Hour);
                        Ent_timein_min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_min.value;
				        Ent_Time_In_Min=Trim(Time_In_Min) 
                        // alert("Time_In_Min=" + Time_In_Min);
                        Ent_cmb_timein=document.aspnetForm.ctl00$ContentPlaceHolder1$cmb_timein.value;
                       // alert("Ent_cmb_timein=" + Ent_cmb_timein);
                   //Time Out      
                         Ent_timeout_hrs=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_hrs.value;
				        Ent_Time_Out_Hour=Trim(Time_Out_Hour)
				        // alert("Ent_Time_Out_Hour=" + Ent_Time_Out_Hour); 
                        Ent_timeout_min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_min.value;
				        Ent_Time_Out_Min=Trim(Time_Out_Min) 
				       // alert("Ent_Time_Out_Min=" + Ent_Time_Out_Min);
				        Ent_cmb_timeout=document.aspnetForm.ctl00$ContentPlaceHolder1$cmb_timeout.value;	
				       // alert("Ent_cmb_timeout=" + Ent_cmb_timeout); 
				 
				 
				        if (Org_timein_hrs!=Ent_Time_In_Hour)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                        if (Org_timein_min!=Ent_Time_In_Min)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                        if (Org_cmb_timein!=Ent_cmb_timein)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                         if (Org_timeout_hrs!=Ent_timeout_hrs)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                        if (Org_timeout_min!=Ent_timeout_min)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                        if (Org_cmb_timeout!=Ent_cmb_timeout)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
                
                
            } 
              //Travel 
            if (askmileage=="Y") 
			{
                Org_txt_mileage=document.aspnetForm.Org_txt_mileage.value;
              //  alert("Org_txt_mileage=" + Org_txt_mileage);
                Ent_txt_mileage=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_mileage.value;
                Ent_MileageBox=Trim(Ent_txt_mileage)
               // alert("Ent_MileageBox=" + Ent_MileageBox); 
                
                if (Org_txt_mileage!=Ent_MileageBox)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }                   
            }
            if (asktravel=="Y") 
			{     
                Org_txt_drive=document.aspnetForm.Org_txt_drive.value;
              //  alert("Org_txt_drive=" + Org_txt_drive);
                Ent_txt_drive=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_drive.value;
                Ent_Drive_Time=Trim(Ent_txt_drive)
               // alert("Ent_Drive_Time=" + Ent_Drive_Time);  
                
                if (Org_txt_drive!=Ent_Drive_Time)
                        {
                            StrModify_CallVisit_Flag="Y";
                        }
            }  
 
              
           //alert("StrModify_CallVisit_Flag=" + StrModify_CallVisit_Flag); 
                document.aspnetForm.Modify_CallVisit_Flag.value=StrModify_CallVisit_Flag;
                
               // Modify_CallVisit_Flag
}	
	
function Valdation_12hour()
	{
	// For time in
					Time_In_Hour=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_hrs.value;
					//alert("Time_In_Hour=" + Time_In_Hour);
					Time_In_Hour=Trim(Time_In_Hour)
					Time_In_Min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_min.value;
					//alert("Time_In_Min=" + Time_In_Min);
                    Time_In_Min=Trim(Time_In_Min)
                    
					if (Time_In_Hour.indexOf(".")>=0)
						{
						
							alert('<%=vPrompts[55]%>')
							AbleButtons()
							return false;
						}
					if (Time_In_Min.indexOf(".")>=0)
						{
							alert('<%=vPrompts[56]%>')
							AbleButtons()
							return false;
						}
						
					if ((Time_In_Hour=="00")||(Time_In_Hour=="0"))
						{
							alert('<%=vPrompts[30]%>');
							AbleButtons()
							return false;
						}
					if ((Time_In_Hour=="")||(Time_In_Min==""))
						{
							//alert("Please enter a valid Time In");
							alert('<%=vPrompts[30]%>');
							AbleButtons()
							return false;
						}
					else
						{
							if (isNaN(Time_In_Hour))
								{
									//alert("For Time In: Hour must be numeric");
									alert('<%=vPrompts[31]%>');
									AbleButtons()
									return false;
								}
							if (Time_In_Hour>12)
								{
									//alert("For Time In: Hour must be between 1 and 12.");
									alert('<%=vPrompts[32]%>');
									AbleButtons()
									return false;
								}
							if (Time_In_Hour<1)
								{
									//alert("For Time In: Hour must be between 1 and 12.");
									alert('<%=vPrompts[32]%>');
									AbleButtons()
									return false;
								}
							if (isNaN(Time_In_Min))
								{
									//alert("For Time In: Minute must be numeric");
									alert('<%=vPrompts[33]%>');
									AbleButtons()
									return false;
								}
							
							if (Time_In_Min>59)
								{
									//alert("For Time In: Minutes must be between 0 and 59.");
									alert('<%=vPrompts[34]%>');
									AbleButtons()
									return false;
								}	
						}
					// For time out
					
					Time_Out_Hour=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_hrs.value;
					//alert("Time_Out_Hour=" + Time_Out_Hour);
					Time_Out_Hour=Trim(Time_Out_Hour)
					Time_Out_Min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_min.value;
					//alert("Time_Out_Min=" + Time_Out_Min);
					Time_Out_Min=Trim(Time_Out_Min)
					
					if (Time_Out_Hour.indexOf(".")>=0)
						{
							alert('<%=vPrompts[57]%>')
							AbleButtons()
							return false;
						}
					if (Time_Out_Min.indexOf(".")>=0)
						{
							alert('<%=vPrompts[58]%>')
							AbleButtons()
							return false;
						}
					
					if ((Time_Out_Hour=="00")||(Time_Out_Hour=="0"))
						{
								
							alert('<%=vPrompts[35]%>');
							AbleButtons()
							return false;
						}
					
					if ((Time_Out_Hour=="")||(Time_Out_Min==""))
						{
							//alert("Please enter a valid Time out");
							
							alert('<%=vPrompts[35]%>');
							AbleButtons()
							return false;
						}
					else
						{
						
							if (isNaN(Time_Out_Hour))
								{
									//alert("For Time Out: Hour must be numeric");
									alert('<%=vPrompts[36]%>');
									AbleButtons()
									return false;
								}
							if (Time_Out_Hour>12)
								{
									//alert("For Time Out: Hour must be between 1 and 12.");
									alert('<%=vPrompts[37]%>');
									AbleButtons()
									return false;
								}
						
							if (isNaN(Time_Out_Min))
								{
									//alert("For Time Out: Minute must be numeric");
									alert('<%=vPrompts[38]%>');
									AbleButtons()
									return false;
								}
							
							if (Time_Out_Min>59)
								{
									//alert("For Time Out: Minutes must be between 0 and 59.");
									alert('<%=vPrompts[39]%>');
									AbleButtons()
									return false;
								}	
						}
						PM_AM_Time_In=document.aspnetForm.ctl00$ContentPlaceHolder1$cmb_timein.value;	
						//alert("PM_AM_Time_In=" + PM_AM_Time_In);	
					
						PM_AM_Time_Out=document.aspnetForm.ctl00$ContentPlaceHolder1$cmb_timeout.value;	
						//alert("PM_AM_Time_Out=" + PM_AM_Time_Out);
						
						Hour_IN=Time_In_Hour
						Hour_OUT=Time_Out_Hour
						
						if ((PM_AM_Time_In=="AM") && (Time_In_Hour==12))
							{
								Hour_IN=0
							}	
						
						if ((PM_AM_Time_In=="PM") && (Time_In_Hour!=12))
							{
								Hour_IN=(eval(Time_In_Hour) + 12)
							}	
						
						 //alert("Hour_IN=" + Hour_IN);	
						
						if ((PM_AM_Time_Out=="AM") &&(Time_Out_Hour==12))
							{
								Hour_OUT=24
							}
							
						if ((PM_AM_Time_Out=="PM") &&(Time_Out_Hour!=12))
							{
								Hour_OUT=(eval(Time_Out_Hour)+ 12)
							}
						
						// alert("nightvisit=" + nightvisit);	
						 
						if (nightvisit=="N")	
							{

								if (eval(Hour_IN)>eval(Hour_OUT))
									{
										//alert("Night visits not allowed for this Job.\n Timeout's Hours has to be bigger than Timein");
										alert('<%=vPrompts[40]%>');
										AbleButtons()
										return false;
									}
								if ((eval(Hour_OUT)==24) && (eval(Hour_IN)!=0))
									{
										if (eval(Hour_OUT)>eval(Hour_IN))
											{
												//alert("Night visits not allowed for this Job.\n Timeout's Hours has to be bigger than Timein");
													alert('<%=vPrompts[41]%>');
													AbleButtons()
												    return false;
											}
									}
									
								if (eval(Hour_IN)>eval(Hour_OUT))
										{				
											//alert("Timeout's Hours has to be bigger than Timein");
											alert('<%=vPrompts[42]%>');
											AbleButtons()
											return false;		
										}	
							}	
						document.aspnetForm.txt_midnight.value=""; 
							//alert("nightvisit=" + nightvisit);
						if (nightvisit=="Y")	
							{
								nightvisit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Past_Midnight[0].checked;
								nightvisit_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Past_Midnight[1].checked;    
								//alert("nightvisit_Yes=" + nightvisit_Yes);
								//alert("nightvisit_No=" + nightvisit_No);
								if ((nightvisit_Yes==false) && (nightvisit_No==false))
									{
										//alert("Please answer the question: \n Did your visit extend past midnight?");
										alert('<%=vPrompts[43]%>');
										AbleButtons()
										return false;
									}
								if (nightvisit_Yes==true)	
									{
										Check_nightvisit="true"
									
									}
									
								if (nightvisit_No==true)	
									{
										Check_nightvisit="false"
										
									}
									//alert("Check_nightvisit=" + Check_nightvisit);	
									
								if (eval(Hour_IN)>eval(Hour_OUT))
									{
										document.aspnetForm.txt_midnight.value="Y";  
									}
								if ((eval(Hour_OUT)==24) && (eval(Hour_IN)!=0))
									{
										if (eval(Hour_OUT)>eval(Hour_IN))
											{
												document.aspnetForm.txt_midnight.value="Y";  
											}
									}
								//alert("Checkbox_nightvisit=" + Checkbox_nightvisit);		
									
								if (Check_nightvisit=="false") 
									{
										//alert("what");	
										if (Hour_OUT==24)
											{
												Hour_OUT=0
											}	
										
										if (PM_AM_Time_Out==PM_AM_Time_In)
											{	
													
													if (eval(Hour_IN)>eval(Hour_OUT))
														{				
															//alert("Timeout's Hours has to be bigger than Timein");
															alert('<%=vPrompts[44]%>');
															AbleButtons()
															return false;				
														}
													if (eval(Hour_IN)==eval(Hour_OUT))
														{				
															if (eval(Time_In_Min)>eval(Time_Out_Min))
																	{
																		//alert("Timeout's Minutes has to be bigger than Timein");
																		alert('<%=vPrompts[45]%>');
																		AbleButtons()
																		return false;
																	}
															if (eval(Time_In_Min)==eval(Time_Out_Min))
																	{
																		//alert("Timeout can not be the same as Timein");
																		alert('<%=vPrompts[46]%>');
																		AbleButtons()
																		return false;
																	}		
														}
											}
										else
											{
												if (eval(Hour_IN)>eval(Hour_OUT))
														{				
															//alert("Your visit time has extended past midnight.\n Please answer the question as YES or change your time in and out.");
															alert('<%=vPrompts[47]%>');
															AbleButtons()
															return false;		
														}		
											}	
									} 
								if (Check_nightvisit=="true") 
									{
										if (PM_AM_Time_Out=="PM")
											{
												//alert("This is not a over night visit.");
												alert('<%=vPrompts[48]%>');
												AbleButtons()
												return false;
											}
									}	
							}	
                       
						if ((eval(Hour_IN)==eval(Hour_OUT))||((eval(Hour_OUT)==24) && (eval(Hour_IN)==0)))
							{	
								if (PM_AM_Time_Out==PM_AM_Time_In)
									{		
										if (eval(Time_In_Min)>eval(Time_Out_Min))
												{
													//alert("Timeout's Minute has to be bigger than Timein");
													alert('<%=vPrompts[49]%>');
													AbleButtons()
													return false;
												}
										if (eval(Time_In_Min)==eval(Time_Out_Min))
												{
													//alert("Timeout can not be the same as Timein");
													alert('<%=vPrompts[50]%>');
													AbleButtons()
													return false;
												}
									}		
							}		
				 
					var DisplayMess="";		
					document.aspnetForm.Str_timein_hrs.value=Time_In_Hour;
					document.aspnetForm.Str_timein_min.value=Time_In_Min;
					document.aspnetForm.Str_cmb_timein.value=PM_AM_Time_In;
					document.aspnetForm.Str_timeout_hrs.value=Time_Out_Hour;
					document.aspnetForm.Str_timeout_min.value=Time_Out_Min;
					document.aspnetForm.Str_cmb_timeout.value=PM_AM_Time_Out;
				 
					 
			 
	}
function Valdation_24hour()
	{
	// For time in
					Time_In_Hour=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_hrs.value;
					// alert("Time_In_Hour=" + Time_In_Hour);
					Time_In_Hour=Trim(Time_In_Hour)
					Time_In_Min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timein_min.value;
					// alert("Time_In_Min=" + Time_In_Min);
                    Time_In_Min=Trim(Time_In_Min)
                    
					if (Time_In_Hour.indexOf(".")>=0)
						{
						
							alert('<%=vPrompts[55]%>')
							AbleButtons()
							return false;
						}
					if (Time_In_Min.indexOf(".")>=0)
						{
							alert('<%=vPrompts[56]%>')
							AbleButtons()
							return false;
						}
						
					if ((Time_In_Hour=="")||(Time_In_Min==""))
						{
							//alert("Please enter a valid Time In");
							alert('<%=vPrompts[30]%>');
							AbleButtons()
							return false;
						}
					else
						{
							if (isNaN(Time_In_Hour))
								{
									//alert("For Time In: Hour must be numeric");
									alert('<%=vPrompts[31]%>');
									AbleButtons()
									return false;
								}
							if (Time_In_Hour>23)
								{
									//alert("For Time In: Hour must be between 1 and 12.");
									alert('<%=vPrompts[93]%>');
									AbleButtons()
									return false;
								}
							if (Time_In_Hour<0)
								{
									//alert("For Time In: Hour must be between 1 and 12.");
									alert('<%=vPrompts[93]%>');
									AbleButtons()
									return false;
								}
							if (isNaN(Time_In_Min))
								{
									//alert("For Time In: Minute must be numeric");
									alert('<%=vPrompts[33]%>');
									AbleButtons()
									return false;
								}
							
							if (Time_In_Min>59)
								{
									//alert("For Time In: Minutes must be between 0 and 59.");
									alert('<%=vPrompts[34]%>');
									AbleButtons()
									return false;
								}	
						}
					// For time out
					
					Time_Out_Hour=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_hrs.value;
					// alert("Time_Out_Hour=" + Time_Out_Hour);
					Time_Out_Hour=Trim(Time_Out_Hour)
					Time_Out_Min=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_timeout_min.value;
					//alert("Time_Out_Min=" + Time_Out_Min);
					Time_Out_Min=Trim(Time_Out_Min)
					
					if (Time_Out_Hour.indexOf(".")>=0)
						{
							alert('<%=vPrompts[57]%>')
							AbleButtons()
							return false;
						}
					if (Time_Out_Min.indexOf(".")>=0)
						{
							alert('<%=vPrompts[58]%>')
							AbleButtons()
							return false;
						}
					
				
					if ((Time_Out_Hour=="")||(Time_Out_Min==""))
						{
							//alert("Please enter a valid Time out");
							
							alert('<%=vPrompts[35]%>');
							AbleButtons()
							return false;
						}
					else
						{
						
							if (isNaN(Time_Out_Hour))
								{
									//alert("For Time Out: Hour must be numeric");
									alert('<%=vPrompts[36]%>');
									AbleButtons()
									return false;
								}
							if (Time_Out_Hour>23)
								{
									//alert("For Time Out: Hour must be between 1 and 12.");
									alert('<%=vPrompts[94]%>');
									AbleButtons()
									return false;
								}
						   if (Time_Out_Hour<0)
								{
									//alert("For Time In: Hour must be between 1 and 12.");
									alert('<%=vPrompts[94]%>');
									AbleButtons()
									return false;
								}
							if (isNaN(Time_Out_Min))
								{
									//alert("For Time Out: Minute must be numeric");
									alert('<%=vPrompts[38]%>');
									AbleButtons()
									return false;
								}
							
							if (Time_Out_Min>59)
								{
									//alert("For Time Out: Minutes must be between 0 and 59.");
									alert('<%=vPrompts[39]%>');
									AbleButtons()
									return false;
								}	
						}
						 
						
						Hour_IN=Time_In_Hour
						Hour_OUT=Time_Out_Hour
						
					
						
					// alert("Hour_OUT=" + Hour_OUT);	
						 
						if (nightvisit=="N")	
							{

								if (eval(Hour_IN)>eval(Hour_OUT))
									{
										//alert("Night visits not allowed for this Job.\n Timeout's Hours has to be bigger than Timein");
										alert('<%=vPrompts[40]%>');
										AbleButtons()
										return false;
									}
								if (eval(Hour_IN)==eval(Hour_OUT))
									{				
										if (eval(Time_In_Min)>eval(Time_Out_Min))
												{
													//alert("Timeout's Minutes has to be bigger than Timein");
													alert('<%=vPrompts[45]%>');
													AbleButtons()
													return false;
												}
										if (eval(Time_In_Min)==eval(Time_Out_Min))
												{
													//alert("Timeout can not be the same as Timein");
													alert('<%=vPrompts[46]%>');
													AbleButtons()
													return false;
												}		
									}
								
							}	
						document.aspnetForm.txt_midnight.value=""; 
						 //alert("nightvisit=" + nightvisit);
							//alert("nightvisit=" + nightvisit);
						if (nightvisit=="Y")	
							{
								nightvisit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Past_Midnight[0].checked;
								nightvisit_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Past_Midnight[1].checked;    
								//alert("nightvisit_Yes=" + nightvisit_Yes);
								//alert("nightvisit_No=" + nightvisit_No);
								if ((nightvisit_Yes==false) && (nightvisit_No==false))
									{
										//alert("Please answer the question: \n Did your visit extend past midnight?");
										alert('<%=vPrompts[43]%>');
										AbleButtons()
										return false;
									}
								if (nightvisit_Yes==true)	
									{
										Check_nightvisit="true"
									
									}
									
								if (nightvisit_No==true)	
									{
										Check_nightvisit="false"
										
									}
									//alert("Check_nightvisit=" + Check_nightvisit);	
									
								if (eval(Hour_IN)>eval(Hour_OUT))
									{
										document.aspnetForm.txt_midnight.value="Y";  
									}
								if ((eval(Hour_OUT)==00) && (eval(Hour_IN)!=0))
									{
										if (eval(Hour_OUT)>eval(Hour_IN))
											{
												document.aspnetForm.txt_midnight.value="Y";  
											}
									}
								//alert("Checkbox_nightvisit=" + Checkbox_nightvisit);		
									
								if (Check_nightvisit=="false") 
									{
										if (eval(Hour_IN)>eval(Hour_OUT))
											{				
												//alert("Timeout's Hours has to be bigger than Timein");
												alert('<%=vPrompts[44]%>');
												AbleButtons()
												return false;				
											}
									} 
								if (Check_nightvisit=="true") 
									{
										if (eval(Hour_OUT)>eval(Hour_IN))
											{
												//alert("This is not a over night visit.");
												alert('<%=vPrompts[48]%>');
												AbleButtons()
												return false;
											}
									}	
							}	
                       
						if (eval(Hour_IN)==eval(Hour_OUT))
							{				
								if (eval(Time_In_Min)>eval(Time_Out_Min))
										{
											//alert("Timeout's Minutes has to be bigger than Timein");
											alert('<%=vPrompts[45]%>');
											AbleButtons()
											return false;
										}
								if (eval(Time_In_Min)==eval(Time_Out_Min))
										{
											//alert("Timeout can not be the same as Timein");
											alert('<%=vPrompts[46]%>');
											AbleButtons()
											return false;
										}		
							}
				 
					var DisplayMess="";		
					document.aspnetForm.Str_timein_hrs.value=Time_In_Hour;
					document.aspnetForm.Str_timein_min.value=Time_In_Min;
					document.aspnetForm.Str_cmb_timein.value="";
					document.aspnetForm.Str_timeout_hrs.value=Time_Out_Hour;
					document.aspnetForm.Str_timeout_min.value=Time_Out_Min;
					document.aspnetForm.Str_cmb_timeout.value="";
				 
					 
			return true; 
	}
function DoSubmitEckerd()
	{
			Ask_EShelf_Question=document.aspnetForm.Ask_EShelf_Question.value
			//alert("Ask_EShelf_Question=" + Ask_EShelf_Question);
			if (Ask_EShelf_Question=="Y")
			{
				Radio_EShelf_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$Radio_EShelf[0].checked;
				Radio_EShelf_No=document.aspnetForm.ctl00$ContentPlaceHolder1$Radio_EShelf[1].checked;    
				if ((Radio_EShelf_Yes==false) && (Radio_EShelf_No==false))
					{
						//alert("Please answer the question: \n Have you reported your EShelf information?");
						alert('<%=vPrompts[60]%>');
						return false;
					}
			} 
		document.aspnetForm.action = "CFTimeInputsEckerd.asp";
		document.aspnetForm.submit();
		return false;	
	}	
function StoreChangeSubmit()	
	{
	   document.aspnetForm.action="CFStoreChangeInPuts.asp";
	   document.aspnetForm.submit();
	   return false;	
	}
	
function DoSubmitBack(buttonName)
	{
	
		GoToDeletionFlag=document.aspnetForm.GoToDeletionFlag.value
	    //alert("buttonName=" + buttonName);
	    BackToGrid=document.aspnetForm.BackToGrid.value
	// alert("BackToGrid=" + BackToGrid);
	    NewScreenPage=document.aspnetForm.NewScreenPage.value
           StrNewCallFormPathLink=document.aspnetForm.StrNewCallFormPathLink.value
	     
	     DisableBackButtons(buttonName)
	     if (BackToGrid=="Y")
	         {
	            document.aspnetForm.action = "CFJWT_Input_Photo_Option.aspx";
	         }
	     else
	        {
	              if (NewScreenPage=="Y")
                     {
                         document.aspnetForm.action=StrNewCallFormPathLink   
                     }
                   else
                   {
    	                     if (GoToDeletionFlag=="app2")
                                    {
                                            // document.aspnetForm.action = "http://app2.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		                                  //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		                                  document.aspnetForm.action = "https://app4.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                                    }
                                     if (GoToDeletionFlag=="chinaapp1")
                                    {
                                            document.aspnetForm.action = "http://chinaapp2.sparinc.com/callsdeletion/ivr_deletion_main.asp";
		                                  //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                                    }
                                     if (GoToDeletionFlag=="dev2k8")
                                    {
                                              document.aspnetForm.action = "http://dev2k8.sparinc.com/callfromdeletion_production/ivr_deletion_main.asp";
		                                  //document.aspnetForm.action = "http://dev2k8.sparinc.com/callsdeletion/ivr_deletion_main.asp";
                                    }
				    }
    	    }
	    document.aspnetForm.submit();
	    return false;	
	//window.history.go(-2)	
	}
function DisableBackButtons(buttonName)
	{
	          //******* Disabled the buttons
	         //Button2 is NEXT
             //Button3 is BACK 
             //Submit is Photo Upload 
             //alert("buttonName=" + buttonName);
	        var NEXTExists=document.getElementById("ctl00_ContentPlaceHolder1_Button2");
            if (NEXTExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;  
            }
            var PhotoExists=document.getElementById("ctl00_ContentPlaceHolder1_Submit");
            if (PhotoExists!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit.disabled=true; 
            }
             var PhotoExists1=document.getElementById("ctl00_ContentPlaceHolder1_Submit2");
            if (PhotoExists1!=null)
            {
               document.aspnetForm.ctl00$ContentPlaceHolder1$Submit2.disabled=true; 
            }
            
            
            ButName="ctl00$ContentPlaceHolder1$" + buttonName
            eval("document.aspnetForm." + ButName + ".disabled=true")
	         
	}	
function GoToPhotoPage()
	{
	        DisableButtons()
	      	DateRule=document.aspnetForm.DateFormat.value
	         //alert("DateRule=" + DateRule);
	    //Error_Flag = "Y"
	     var NEXTExists=document.getElementById("ctl00_ContentPlaceHolder1_txt_visitmonth");
	      //alert("NEXTExists=" + NEXTExists);
            if (NEXTExists!=null)
            {
                 //alert("exists");
            
                      
            	    
		            //************* Visit date ************************
            	 
		            if ((document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value=="") || (document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value==""))
		             {
			            alert('<%=vPrompts[59]%>'); 
			            AbleButtons()
			            return false;
		             }
		            else
		             {
						            var	delimiter,date_format,JEdate,i, CorrectDate
            		
            						 
            		
						            CorrectDate="";
						            delimiter="";
						            date_format = DateRule;
						            POS_Dot=date_format.indexOf(".")	
						            if (POS_Dot>0)
						            {
							            delimiter="."
						            }
						            POS_Back_slash=date_format.indexOf("/")	
						            if (POS_Back_slash>0)
						            {
							            delimiter="/"
						            }
						            POS_Dash=date_format.indexOf("-")	
						            if (POS_Dash>0)
						            {
							            delimiter="-"
						            }
						            JEdate = date_format.split(delimiter);
            						
            						
            						
            						
						            for(i=0; i<JEdate.length; i++)
							            {
										            if (JEdate[i] == "mm")
										            {
											            CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
										            }
										            if (JEdate[i] == "dd")
										            {
											            CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
										            }
										            if (JEdate[i] == "yyyy" || JEdate[i] == "yy" )
										            {
											            CorrectDate=CorrectDate+document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
										            }
									            if (i<2) 
										            {
											            CorrectDate=CorrectDate + "" + delimiter + "";
										            }
							            }  
						                       // end of for 
						                       //visit date for photo upload
	                                    document.aspnetForm.Job_Visit_Date.value=CorrectDate;
	                                    StrMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
	                                    StrDay=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
	                                    StrYear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
            	                        
							             //alert("CorrectDate=" + CorrectDate);
							            // put the value in a hidden variable 
							            document.aspnetForm.Hidden_date.value=CorrectDate;
							            // pass the value to our multilanguage Function
							            sys_rule=DateRule
							            //alert("year=" +document.TimeValidation.txt_visityear.value);
							            //alert("sys_rule=" + sys_rule);
							             StrDateCheck=StrMonth + "" + StrDay + "" + StrYear;  
//			                             if (DatecheckNumber(StrDateCheck)==false)
//						                        {
//						                             //alert("check");
//						                            alert('<%=vPrompts[59]%>');
//						                            AbleButtons()
//                                                    return false;
//						                        }     
//							            if (DateValidation(CorrectDate,sys_rule,'<%=vPrompts[59]%>')==false)
//							             {
//							                AbleButtons()
//								            return false;
//							             }
			            }
        			  if (GridDateCheck(CorrectDate)==false)
		                 {
		                    AbleButtons()
			                return false;
		                 } 
		                //***** Assign date to hidden variables
		                Str_VisitMonth=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitmonth.value;
                        Str_visitday=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visitday.value;
                        Str_visityear=document.aspnetForm.ctl00$ContentPlaceHolder1$txt_visityear.value;
                        
		                 document.aspnetForm.Str_VisitMonth.value=Str_VisitMonth;
                         document.aspnetForm.Str_visitday.value=Str_visitday;
                         document.aspnetForm.Str_visityear.value=Str_visityear;
                         
              } //end of NEXTExists
		 //document.aspnetForm.action = "CFPictureGetFileSV.asp";
		 	Photo_By_QuestionFlag=document.aspnetForm.Photo_By_QuestionFlag.value
		   // alert("Photo_By_QuestionFlag=" + Photo_By_QuestionFlag);
		    if (Photo_By_QuestionFlag=="Y")
		        {
		                document.aspnetForm.action = "CFPictureByQuestionList.aspx";
	                    document.aspnetForm.submit();
	                    return false;	 
		        }
		     else
		        {  
		                 //document.aspnetForm.action = "CFPictureGetFileSV.asp";
		                 document.aspnetForm.action = "CFPictureGetFileOption.aspx"
	                     document.aspnetForm.submit();
		                 return false;	
		         }	
//		 document.aspnetForm.action = "CFPictureGetFileOption.aspx"
//	     document.aspnetForm.submit();
//		 return false;		
	}
function gotolink()
	{
	
	//window.open("http://mi10.sparinc.com/NSBO_Manuals/NewDailyActivityResponseForm/DailyActivityResponseForm/DailyActivityResponseForm.htm","openwindow","width=700,height=350,left=0,top=0,toolbar=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");
	window.open("http://mi10.sparinc.com/CallFormSA/InternetCallFormManual.doc","openwindow","width=700,height=350,left=0,top=0,toolbar=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes");
	
	}
function DateValidation(v_date_object, v_date_sys_rule, v_error_msg)
	{
		
		 // alert("v_date_object=" + v_date_object)
		/// alert("v_date_sys_rule=" + v_date_sys_rule)
		//alert("v_error_msg=" + v_error_msg)
		
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
			if((v_date_format.charAt(i).toUpperCase()!='Y')&&(v_date_format.charAt(i).toUpperCase()!="M")&&(v_date_format.charAt(i).toUpperCase()!='D'))
			{
				v_delimiter= v_date_format.charAt(i)
				break;	
			}
		}
		// alert("v_delimiter=" + v_delimiter)
		
		v_date =v_date_object
		dateformatarray = v_date_format.split(v_delimiter)
		var datearray = v_date.split(v_delimiter)
		
		if ((dateformatarray.length) != (datearray.length))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
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
			if (dateformatarray[i] == "yyyy")
			{
				v_year = datearray[i];
				Year_added_val=""
			}
			if (dateformatarray[i] == "yy")
			{
				v_year = datearray[i];
				Year_added_val="20"
			}
		}

		//alert("v_month=" + v_month)
		//alert("v_day=" + v_day)
		//alert("v_year=" + v_year)
		
		for(i=0; i<v_day.length; i++)
		{
			if(isNaN(v_day.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		for(i=0; i<v_month.length; i++)
		{
			if(isNaN(v_month.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		for(i=0; i<v_year.length; i++)
		{
			if(isNaN(v_year.charAt(i)))
			{
				alert(v_error_msg)
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			}
		}
		if((v_month=="") || (v_day=="") || (v_year==""))
		{
			alert(v_error_msg)
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (v_month <1 || v_month >12)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_month ))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (v_day<1 || v_day>31)
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_day))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if (isNaN(v_year))
		{
			alert(v_error_msg);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if ((v_year < 0) || (v_year.length < 2) || (v_year.length > 4))
		{
			alert(v_error_msg+11);
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		if ((v_month ==4 || v_month ==6 || v_month ==9 || v_month ==11) && v_day==31)
		{
			alert (v_error_msg)
			//eval(v_date_object + ".focus()")
			result = false;
			return false;
		}
		
		if (v_month  == 2)
		{
			isleap = (v_year %4 == 0 && (v_year % 100 != 0 || v_year % 400 == 0));
			if (v_day>29 || (v_day==29 && !isleap))
			{
				alert (v_error_msg);
				//eval(v_date_object + ".focus()")
				result = false;
				return false;
			} 
		} 
		/*Check for visit date */
		
		
		TodayDate=document.aspnetForm.TodayDate.value;
		
		
		if (v_year.length==2)
		{
			v_year="20" + v_year
		}
		visit_dt=v_month + "/" + v_day + "/" + v_year 
		
		//alert("visit_dt=" + visit_dt)
		//alert("TodayDate=" + TodayDate)
		
		if (Date.parse(TodayDate)<Date.parse(visit_dt))
			{
				//alert("The Visit date greater than Todays date")
				alert('<%=vPrompts[70]%>');
				return false;
			}
		FieldStartDt=document.aspnetForm.Field_Start_Dt.value
		FieldendDt=document.aspnetForm.Field_end_Dt.value
		KeyCompDt=document.aspnetForm.Key_Comp_Dt.value
		DOADt=document.aspnetForm.DOA_Dt.value
		
		Furn_Assembly_Visit_dt=document.aspnetForm.Furn_Assembly_Visit_dt.value
	   // alert("Furn_Assembly_Visit_dt=" + Furn_Assembly_Visit_dt)
	    
	    if (Furn_Assembly_Visit_dt!="")
	    {
	                    Furn_Assembly_Visit_dtArray = Furn_Assembly_Visit_dt.split(v_delimiter)
				
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								Furn_month = Furn_Assembly_Visit_dtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								Furn_day = Furn_Assembly_Visit_dtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								Furn_year = Furn_Assembly_Visit_dtArray[i];
								}
							}
							if (Furn_year.length==2)
		                    {
			                    Furn_year="20" + Furn_year
		                    }
				Furn_Assembly_Visit_dt=Furn_month + "/"	+ Furn_day + "/" + Furn_year 			
				//alert("Furn_Assembly_Visit_dt=" + Furn_Assembly_Visit_dt)
	            if (Date.parse(visit_dt)!=Date.parse(Furn_Assembly_Visit_dt))
	            {
	                        alert('<%=vPrompts[69]%>');
				            return false;
	            }
	    }
	    
		/*Field start date*/
			
				FieldStartDtArray = FieldStartDt.split(v_delimiter)
				
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								FS_month = FieldStartDtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								FS_day = FieldStartDtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								FS_year = FieldStartDtArray[i];
								}
							}
							if (FS_year.length==2)
		                    {
			                    FS_year="20" + FS_year
		                    }
				FieldStartDt=FS_month + "/"	+ FS_day + "/" + FS_year 			
				//alert("FieldStartDt=" + FieldStartDt)
				
		/*Field End date*/
			
				FieldendDtArray = FieldendDt.split(v_delimiter)
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								FE_month = FieldendDtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								FE_day = FieldendDtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								FE_year = FieldendDtArray[i];
								}
							}
				FieldendDt=FE_month + "/"	+ FE_day + "/" + FE_year 			
	
				//alert("FieldendDt=" + FieldendDt)

			/*DOADt date*/
			
				DOADtArray = DOADt.split(v_delimiter)
						for(i=0; i<dateformatarray.length; i++)
							{
								if (dateformatarray[i] == "mm")
								{
								DO_month = DOADtArray[i];
								}
								if (dateformatarray[i] == "dd")
								{
								DO_day = DOADtArray[i];
								}
								if ((dateformatarray[i] == "yyyy")||(dateformatarray[i] == "yy"))
								{
								DO_year = DOADtArray[i];
								}
							}
							if (DO_year.length==2)
		                    {
			                    DO_year="20" + DO_year
		                    }
				DOADt=DO_month + "/"	+ DO_day + "/" + DO_year 
				
				//alert("FieldStartDt=" + FieldStartDt)
				//alert("DOADt=" + DOADt)
			     //alert("visit_dt=" + visit_dt)
			    //alert("TodayDate=" + TodayDate)
				//return false;

//		if ((Date.parse(visit_dt)<Date.parse(FieldStartDt)) || (Date.parse(visit_dt)>Date.parse(DOADt)))
//			{
//				//alert("The Visit date entered is invalid for this Job,Wave and Task.")
//				alert('<%=vPrompts[69]%>');
//				return false;
//			}
		
	}

function CollectManagerInfo()
{
    Ret_store_visit=document.aspnetForm.Ret_store_visit.value
   		 Collect_Store_Mgr_Name=document.aspnetForm.Collect_Store_Mgr_Name.value;
		 
		       
	if (Ret_store_visit=="Y")
					{
					if (Collect_Store_Mgr_Name=="Y")
						    {
						            rad_q_Ret_store_visit_Yes=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[0].checked;
						            rad_q_Ret_store_visit_No=document.aspnetForm.ctl00$ContentPlaceHolder1$rad_q_Ret_store_visit[1].checked;    
            						 
						            if (rad_q_Ret_store_visit_Yes==true)
						                {
						                     document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.disabled=true;
						                     document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.value="";
						                }
						            if (rad_q_Ret_store_visit_No==true)
						                {
						                    document.aspnetForm.ctl00$ContentPlaceHolder1$txt_Manager_name.disabled=false;
                						    
						                }
						      }
					} 
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
function CalcKeyCode(aChar) 
{
  var code = aChar.charCodeAt(0);
  return code;
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
              if (cCode < 48 || cCode > 57 ) 
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
       //alert("dsdads")      
//    var TxtReadOnly = document.getElementById('txt_visitmonth').readOnly;
    
    
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;
    //alert("charCode=" + charCode);
    //***** charCode=13 is Enter key
    if (charCode==13)
	{
		return false;
    }
                       
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	{
		return false;
    }
	return true;
}

function GridDateCheck(PassStrDate)
{
        DateFormat=document.aspnetForm.DateFormat.value;

      // alert("PassStrDate=" + PassStrDate)
       StrGridDates=document.aspnetForm.StrGridDates.value;
      //alert("StrGridDates=" + StrGridDates);
        Date_input=document.aspnetForm.Date_input.value;
       // alert("Date_input=" + Date_input);
        
        //***** Call Form has access or not
        GridAddNewVisit=document.aspnetForm.GridAddNewVisit.value;
      // alert("Date_input=" + Date_input);
       if (GridAddNewVisit=="Yes")
       {
         //***** date that passed from the gridview 
        PassStrDateArray = PassStrDate.split(Date_input)
        
        //***** date format like mm/dd/yyyy 
        LoopFormatArray = DateFormat.split(Date_input)
         
         
        AllDateArray = StrGridDates.split("|")
       // alert("AllDateArray=" + AllDateArray.length);
		for(i=0; i<AllDateArray.length-1; i++)
			{
			 GridArrayDate=AllDateArray[i] 
			  //alert("GridArrayDate=" + GridArrayDate);
			  LoopDateArray = GridArrayDate.split(Date_input)
			 // alert("LoopDateArray=" + LoopDateArray);
			
			 
		                 for(s=0; s<LoopFormatArray.length; s++)
		                        {
			                        if (LoopFormatArray[s] == "mm")
			                        {
			                           G_month = LoopDateArray[s];
			                           P_month = PassStrDateArray[s]; 
			                        }
			                        if (LoopFormatArray[s] == "dd")
			                        {
			                           G_day = LoopDateArray[s];
			                           P_day = PassStrDateArray[s]; 
			                        }
			                        if (LoopFormatArray[s] == "yyyy")
			                        {
				                        G_year = LoopDateArray[s];
				                        P_year = PassStrDateArray[s];
				                        Year_added_val=""
			                        }
			                        if (LoopFormatArray[s] == "yy")
			                        {
				                        G_year = LoopDateArray[s];
				                        P_year = PassStrDateArray[s];
				                        //P_year="20" + P_year;
			                        }
		                        }
		             Grid_visit_dt=G_month + "/" + G_day + "/" + G_year 
		             Passed_visit_dt=P_month + "/" + P_day + "/" + P_year 
		              //alert("Grid_visit_dt=" + Grid_visit_dt);
		            // alert("Passed_visit_dt=" + Passed_visit_dt);
		             
		            if (Date.parse(Grid_visit_dt)==Date.parse(Passed_visit_dt))
			            {
				            // alert("The Visit date  you entered was already used. Please go back and verify your visit date.")
				              alert('<%=vPrompts[79]%>');
				              document.aspnetForm.BackToGrid.value="Y"; 
				            return false;
			            }
		
		            //alert("Grid_visit_dt=" + Grid_visit_dt)
			}// end of first loop
	}//end of  if (Photo_CF_Access!="Yes")		

}

</script>
<div id="ITS_MyControl_FullPageDiv" >
</div>

<span id="ShowDetail"   runat="server" visible="false"></span>

<input name="InformationDisplay" type="hidden" value="<%=StrInformationDisplay%>"/>
 <input id="Merch_no" type="hidden" runat="server" />
<input name="Hidden_date" type="hidden" value="" />
<input name="Job_Visit_Date" type="hidden" value="<%=Job_Visit_Date%>" />		
<input name="Visit_Date" type="hidden" value="" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />
<input name="txt_EmailAdd" type="hidden" value="<%=txt_EmailAdd%>" />
<input name="txt_Mobile_Email" type="hidden" value="<%=txt_Mobile_Email%>" />

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
<input name="Key_Comp_Dt" type="hidden" value="<%=Key_Comp_Dt%>"/>
<input name="DOA_Dt" type="hidden" value="<%=DOA_Dt%>"/>		
	
<input name="TodayDate" type="hidden" value="<%=TodayDate%>"/>		
			
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

<input name="Str_VisitMonth" type="hidden" value="<%=Str_VisitMonth%>" />
<input name="Str_visitday" type="hidden" value="<%=Str_visitday%>" />
<input name="Str_visityear" type="hidden" value="<%=Str_visityear%>" />

<input name="Str_timein_hrs" type="hidden" value="<%=Str_timein_hrs%>" />
<input name="Str_timein_min" type="hidden" value="<%=Str_timein_min%>" />
<input name="Str_cmb_timein" type="hidden" value="<%=Str_cmb_timein%>" />
<input name="Str_timeout_hrs" type="hidden" value="<%=Str_timeout_hrs%>" />
<input name="Str_timeout_min" type="hidden" value="<%=Str_timeout_min%>" />
<input name="Str_cmb_timeout" type="hidden" value="<%=Str_cmb_timeout%>" />
<input name="Str_txt_mileage" type="hidden" value="" />
<input name="Str_txt_drive" type="hidden" value="" />

<input name="Org_VisitMonth" type="hidden" value="<%=Str_VisitMonth%>" />
<input name="Org_visitday" type="hidden" value="<%=Str_visitday%>" />
<input name="Org_visityear" type="hidden" value="<%=Str_visityear%>" />
<input name="Org_timein_hrs" type="hidden" value="<%=Str_timein_hrs%>" />
<input name="Org_timein_min" type="hidden" value="<%=Str_timein_min%>" />
<input name="Org_cmb_timein" type="hidden" value="<%=Str_cmb_timein%>" />
<input name="Org_timeout_hrs" type="hidden" value="<%=Str_timeout_hrs%>" />
<input name="Org_timeout_min" type="hidden" value="<%=Str_timeout_min%>" />
<input name="Org_cmb_timeout" type="hidden" value="<%=Str_cmb_timeout%>" />
<input name="Org_txt_mileage" type="hidden" value="<%=Str_txt_mileage%>" />
<input name="Org_txt_drive" type="hidden" value="<%=Str_txt_drive%>" />
<input name="Modify_CallVisit_Flag" type="hidden" value="" />

<input name="Str_rad_q_Past_Midnight" type="hidden" value="" />
<input name="Str_rad_q_HH_Used" type="hidden" value="" />
<input name="Str_Manager_Title" type="hidden" value="<%=Str_Manager_Title%>" />
<input name="Str_txt_Manager_name" type="hidden" value="<%=Str_txt_Manager_name%>" />
<input name="Star_time" type="hidden" value="<%=Star_time%>"/>
 <input name="DateFormat" type="hidden" value="<%=DateRule%>" />
<input name="NewCallForm" type="hidden" value="Y" />
<input name="Furn_Assembly_Visit_dt" type="hidden" value="<%=Furn_Assembly_Visit_dt%>" />
<input name="Bus_Rule22_Photo" type="hidden" value="<%=Bus_Rule22_Photo%>" />
<input name="StrGridDates" type="hidden" value="<%=StrGridDates%>" />
<input name="Date_input" type="hidden" value="<%=Date_input%>" />
<input name="Photo_CF_Access" type="hidden" value="<%=Photo_CF_Access%>" />
<input name="GridAddNewVisit" type="hidden" value="<%=GridAddNewVisit%>" />
<input name="BackToGrid" type="hidden" value="" />
<input name="Photo_By_QuestionFlag" type="hidden" value="<%=Photo_By_QuestionFlag%>"/>
  <input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<input name="StrNewCallFormPathLink" type="hidden" value="<%=StrNewCallFormPathLink%>"/>
<input type="hidden" name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<input type="hidden" name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
<input name="HourRule" type="hidden" value="<%=HourRule%>" />
<input type="hidden" name="CFD_VisitDate_Edit" value="<%=CFD_VisitDate_Edit%>"/>
<Input type="hidden" name="GoToDeletionFlag" value="<%=GoToDeletionFlag%>"/>

<%  
    if (Product_Check_Flag=="Y")
    {
						%> 
							<asp:Label ID="Label8" runat="server" Text="The system indicates that the product information is not reported. if you have used a hand held then please make sure that you have uploaded the data prior to reporting the call form information. if you did not use the hand held then call teleservices at 800-501-2686 to report the product information prior to reporting the call form information."  class="reportCriteriaHeader"></asp:Label> 
							<br />
							<br />
							<asp:Button   OnClientClick="return DoSubmitBack('Button4')" ID="Button4" runat="server" Text="&lt;&lt; Back" CssClass="Button"></asp:Button>
						<%										
	}
    
    
    if (Error_Flag == "Y")
    {
                        if (BusinessQuestion_Flag == 1)
                        {
                                                %>
                         	                         <asp:table  runat="server" id="table17"  BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                                        <asp:TableRow>
                                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          <asp:Label ID="Label10" Text="Question:"  runat="server"  ></asp:Label>
                                                               </asp:TableCell>
                                                               <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                                          <asp:Label ID="Label11" Text="Do you have OOS to report for this job/wave/task?" runat="server"  ></asp:Label>
                                                               </asp:TableCell>
                                                         </asp:TableRow>
                                                         <asp:TableRow>
                                                                  <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                                      
                                                               </asp:TableCell>
                                                                <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                           <%
                                                                                
                                                                               OutofStocksQuestion.SelectedValue = OutOfStock_no;										     
                                                                            %>
                                                                                  <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="OutofStocksQuestion">
                                                                                  <asp:ListItem   Value="1">YES</asp:ListItem>
                                                                                  <asp:ListItem  Value="0">NO</asp:ListItem>
                                                                                  </asp:RadioButtonList>
                                                                                
                                                                                
                                                                </asp:TableCell>
                                                         </asp:TableRow>
                                                         <asp:TableRow>
                                                                 <asp:TableCell  ColumnSpan="2" HorizontalAlign="Center" CssClass="selectionCriteriaItem">
                                                                    <input name="UseTheCallForm" type="hidden" value="YES" id="Hidden3" />
													                <input name="OutOfStock_no" type="hidden" value="<%=OutOfStock_no%>" id="Hidden5" />
													                  
													                <asp:Button  OnClientClick="return DoSubmitBack('Button6')" ID="Button6" runat="server" Text="<< Back" CssClass="Button"></asp:Button>
					                                                &nbsp&nbsp
					                                                <asp:Button  OnClientClick="return RefreshOOS()" ID="Button5" runat="server" Text="Next >>" CssClass="Button"></asp:Button>             
                                                                </asp:TableCell>				
                                                          </asp:TableRow>										
                                                     </asp:table>    		
									                 

                                             <% 
                        }        
					else
                        {
					                         %>
									<table width="100%" border="0">
										<tr>
											<td align="center">
												    <table width="100%" border="0">
													    <tr>
														    <td class="reportCriteriaHeader"><center><%=return_Message%></center>
														    </td>
													    </tr>
												    </table> 	
											</td>
										</tr>
											
										<tr>
											<td align="center">
												<%
												if (PhotoButton=="YES") 
                                                {   
												        %>
												         <asp:Button  OnClientClick="return GoToPhotoPage()"  id="Submit2" runat="server"   text="Photo Upload" CssClass="Button"></asp:Button>
														        &nbsp&nbsp
												        <%
                                                }


                                                if (Nextbutton == "true")
                                                {  
												                %>
															        <input name="UseTheCallForm" type="hidden" value="YES" id="Hidden4" />
												                <%
                                                            if (Bus_Rule22_Photo == "N")
                                                            {	
																		%>
																		<asp:Button  OnClientClick="return refresh()"  id="Button1" runat="server"   text="Call Form" CssClass="Button"></asp:Button>
																			&nbsp&nbsp
																		<%
                                                            }
                                                }
                                                else
                                                {
												%>
														<input name="UseTheCallForm" type="hidden" value="NO" />
												<%
                                                 }
												%>
												
												<asp:Button  OnClientClick="return DoSubmitBack('Button7')" ID="Button7" runat="server" Text="<< Back" CssClass="Button"></asp:Button>
												
												<input name="Excute_SQL" type="hidden" value="<%=Excute_SQL%>" />
												
											</td>
										</tr>
									</table>
									<% 
					            //End of if (BusinessQuestion_Flag == 1)
                        }

    } //if (Error_Flag== "Y")   
    if (Error_Flag != "Y")
    {   
                        // upload photo first before answering Call Form
                        if (Bus_Rule22_Photo == "Y")
                        {
		                    %>
			                   <asp:Label ID="Label9" runat="server" Text="You must upload a photo for this J/W/T."  CssClass="reportCriteriaHeader"></asp:Label><br /> 
		                    <% 
		                    
		                    
                        }
                    	
                        //if (Bus_Rule22_Photo == "N")
                       // {
                            
                            //*************** Collect Visit date
                            %>
                            

                            <br />
                            <br />
                            
								<asp:table  runat="server" id="table1"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
								<asp:TableRow>
								    <asp:TableCell  Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
								    <asp:Label ID="Label1" runat="server" Text="Visit Date:"  CssClass="selectionCriteriaItem"></asp:Label> 
								            
								    </asp:TableCell>
								    <asp:TableCell Width="50%" CssClass="selectionCriteriaItem"  HorizontalAlign="Left" > 
								              <%
											   
                                                    string[] ArrayDateRule;
                                                    int d,maxlen;
                                                    
                                                    ArrayDateRule = new string[3];
                                                    ArrayDateRule = DateRule.Split(Date_input.ToCharArray());
                                                    //DateRule
							                        	                  
                                                    maxlen =0;
                                                    for (d = 0; d < ArrayDateRule.Length; d++)
                                                    {
                                                        //Response.Write("d =" + d + "<BR>");
                                                        //Response.Write("ArrayDateRule =" + ArrayDateRule[d].ToString() + "<BR>");
                                                                    if (ArrayDateRule[d].ToUpper() == ("mm").ToUpper())
                                                                    {
															                    %>
															                    <asp:TextBox Width="8%"   runat="server"   MaxLength="2"  ID="txt_visitmonth" ></asp:TextBox> 
															                    <%
                                                                    }
                                                                    if (ArrayDateRule[d].ToUpper() == ("dd").ToUpper())
                                                                    {
																                    %>            
																                    <asp:TextBox Width="8%"  runat="server"   MaxLength="2"  ID="txt_visitday" ></asp:TextBox> 
																                    <%
                                                                    }
                                                                //if UCase(trim(DateArray(i))) = UCase("yyyy") then
                                                                    
                                                                    if (ArrayDateRule[d].ToUpper() == ("yy").ToUpper())
                                                                    {
                                                                        txt_visityear.MaxLength = 2;
                                                                        maxlen = 2;				
                                                                    }
                                                                    if (ArrayDateRule[d].ToUpper() == ("yyyy").ToUpper())
                                                                    {

                                                                        txt_visityear.MaxLength = 4;
                                                                        maxlen = 4;	 			
                                                                    }
                                                                    if (maxlen>0)
                                                                    {
                                                                          
                                                                            %>   
												                            <asp:TextBox Width="10%"  runat="server"  ID="txt_visityear" ></asp:TextBox>
												                            <%
                                                                                maxlen = 0;
                                                                    }	
                                                      }	
												    %>
												 
											    <span class="selectionCriteriaMDY">&nbsp;(<%=DateRule%>)</span>
										    
								    </asp:TableCell>
								    
								</asp:TableRow> 
								</asp:table>
								  
									 <br />
                                   
                                <%
                                //**********************Collect Time in and out
                            
                                if (Collect_iVR_Time == "Y")
                                {   
					            %>  
                                             <asp:table  runat="server" id="table2" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                                 <asp:TableRow>
                                                       <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                         <%
                                                        if (HourRule=="12")
                                                          {
                                                        %>
                                                              <asp:Label ID="Label5" runat="server" Text="Note:"  CssClass="selectionCriteriaItem"></asp:Label> 
                                                       <%
                                                         }
                                                        %>
                                                       </asp:TableCell>
                                                       <asp:TableCell Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                         <%
                                                        if (HourRule=="12")
                                                          {
                                                        %>
                                                             <asp:Label ID="Label6" runat="server" Text="12PM = Noon and 12AM = Midnight"  CssClass="selectionCriteriaItem"></asp:Label> 
                                                        <%
                                                         }
                                                        %>
                                                       </asp:TableCell>
                                                  </asp:TableRow>   
                                                  <asp:TableRow>
                                                        <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                              <asp:Label ID="Label7" runat="server" Text=" Time In :"  CssClass="selectionCriteriaItem"></asp:Label> 
                                                        </asp:TableCell>
                                                        <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                <%
                                                                    txt_timein_hrs.Text = Str_timein_hrs;
                                                                    txt_timein_min.Text = Str_timein_min;
                                                                %>
                                                              <asp:TextBox Width="8%"  runat="server"   MaxLength="2"  ID="txt_timein_hrs" ></asp:TextBox> 
															  <asp:TextBox Width="8%"  runat="server"   MaxLength="2"  ID="txt_timein_min" ></asp:TextBox>  
															 
															    <%
                                                                if (HourRule=="12")
                                                                  {
                                                                %>
															  <asp:DropDownList  runat="server" ID="cmb_timein" Width="10%">
															        <asp:ListItem Value="AM">AM</asp:ListItem>
															        <asp:ListItem Value="PM">PM</asp:ListItem>
															  </asp:DropDownList>  
															 &nbsp;<span class="selectionCriteriaMDY">(hh:mm) </span>
															    <%
                                                                 }
                                                                %>
                                                        </asp:TableCell>
                                                  </asp:TableRow>  
                                                   <asp:TableRow>
                                                        <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                               <asp:Label ID="Label2" runat="server" Text="Time Out :"  CssClass="selectionCriteriaItem"></asp:Label> 
                                                               
                                                        </asp:TableCell>
                                                        <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                <%
                                                                    txt_timeout_hrs.Text = Str_timeout_hrs;
                                                                    txt_timeout_min.Text = Str_timeout_min;
                                                                %>
                                                              <asp:TextBox Width="8%"  runat="server"   MaxLength="2"  ID="txt_timeout_hrs" ></asp:TextBox> 
															  <asp:TextBox Width="8%"  runat="server"   MaxLength="2"  ID="txt_timeout_min" ></asp:TextBox>  
															 
															    <%
                                                                if (HourRule=="12")
                                                                  {
                                                                %>
															  <asp:DropDownList  runat="server" ID="cmb_timeout" Width="10%">
															         <asp:ListItem Value="AM">AM</asp:ListItem>
															        <asp:ListItem Value="PM">PM</asp:ListItem>
															  </asp:DropDownList>  
															  &nbsp;<span class="selectionCriteriaMDY">(hh:mm) </span>
															   <%
                                                               }
                                                               %>
                                                        </asp:TableCell>
                                                  </asp:TableRow>    
                                             </asp:table> 
                                <%
                                 }//if (Collect_IVR_Time=="Y")
                                 if (Collect_Store_Mgr_Name=="Y")
                                 {
                                        %>
                                        <asp:table  runat="server" id="table16" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem" >
                                                 <asp:Label ID="Label16" runat="server" Text="Manager`s name:"  CssClass="selectionCriteriaItem"></asp:Label> 
                                               </asp:TableCell>
                                               <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                         <%
                                                             txt_Manager_name.Text = Str_txt_Manager_name;										     
                                                         %>
                                                                
                                                     <asp:TextBox Width="20%"  runat="server"   MaxLength="30"  ID="txt_Manager_name"></asp:TextBox>                 
                                              </asp:TableCell>
                                            </asp:TableRow>
                                             <asp:TableRow>
                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                <asp:Label ID="Label17" runat="server" Text="Manager`s Title:"  CssClass="selectionCriteriaItem"></asp:Label> 
                                               </asp:TableCell>
                                                         
                                               <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                         
                                                     <asp:DropDownList Width="33%"  runat="server" ID="Manager_Title" >
                                                     <asp:ListItem></asp:ListItem>
                                                     </asp:DropDownList>                 
                                              </asp:TableCell>
                                            </asp:TableRow>											
                                         </asp:table> 
                                        <%
                                }       
							    //***************Collect milage
                                 if (Mileage_flag == "Y")
                                 {
                                %>
                                        <asp:table  runat="server" id="table4" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                 
                                                 <asp:Label ID="Label18" runat="server" Text="Visit Miles :"  CssClass="selectionCriteriaItem"></asp:Label>
                                               </asp:TableCell>
                                               <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                        <%
                                                                            txt_mileage.Text = Str_txt_mileage;
                                                                        %>
                                                                      <asp:TextBox Width="10%"  runat="server"   MaxLength="5"  ID="txt_mileage" ></asp:TextBox> 
                                                                     &nbsp;<asp:Label ID="Label3" runat="server" Text="miles"  CssClass="selectionCriteriaMDY"></asp:Label> 
                                              </asp:TableCell>
                                            </asp:TableRow>										
                                         </asp:table> 
                                <%
                              }
                              //***************Collect Time travel
                              if (Travel_flag == "Y")
                              {    
                                     %>
        								 <asp:table  runat="server" id="table5" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                 <asp:Label ID="Label19" runat="server" Text="Drive Time :"  CssClass="selectionCriteriaItem"></asp:Label>
                                               </asp:TableCell>
                                               <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                        <%
                                                                            txt_drive.Text = Str_txt_drive;
                                                                        %>
                                                                      <asp:TextBox Width="10%"  runat="server"   MaxLength="4"  ID="txt_drive"></asp:TextBox> 
                                                                     &nbsp;<asp:Label ID="Label4" runat="server" Text="minutes"  CssClass="selectionCriteriaMDY"></asp:Label> 
                                              </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    												
							         <% 
                              }
                              //*************** Visit goes over midnight
                            if (night_visits=="Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table6" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                      <asp:Label ID="Label20" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>                      
                                                                           
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                    <asp:Label ID="Label21" runat="server" Text="Did your visit extend past midnight?"  CssClass="reportCriteriaHeader"></asp:Label>
                                                                           
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                 
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_Past_Midnight">
                                                                      <asp:ListItem   Value="0" >YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%
                            }
                            //***************Handheld question
                            if (Ask_Q_HH_Used=="Y")
                            {   	
										%>
										 <asp:table  runat="server" id="table7" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                    <asp:Label ID="Label22" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>        
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                                       
                                                          <asp:Label ID="Label23" runat="server" Text=" Did you use your HandHeld Unit?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                               
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_HH_Used">
                                                                      <asp:ListItem   Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
										<%
                        }
                        //*************** Multi - Visit to the store
                       	if (qdef_skippattern=="NO") 
                        {
                            if (Convert.ToInt32(Max_Visit_Per_Store_Mx.Trim()) > Convert.ToInt32(visit_no.Trim()))
                            //if (Max_Visit_Per_Store_Mx.Trim() == visit_no.Trim())
                                            {
        
                                                        %>
										             <asp:table  runat="server" id="table8" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                                        <asp:TableRow>
                                                               <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                <asp:Label ID="Label24" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                                                      
                                                               </asp:TableCell>
                                                               <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                                  <asp:Label ID="Label25" runat="server" Text="Do you have to return to the store to complete the Store Visit?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                                                      
                                                               </asp:TableCell>
                                                         </asp:TableRow>
                                                         <asp:TableRow>
                                                                  <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                                      
                                                               </asp:TableCell>
                                                                <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                                           
                                                                                  <asp:RadioButtonList    CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_Ret_store_visit">
                                                                                  <asp:ListItem    Value="0" >YES</asp:ListItem>
                                                                                  <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                                  </asp:RadioButtonList>
                                                                                
                                                                                <input name="Ret_store_visit" type="hidden" value="Y" />	
                                                                </asp:TableCell>		
                                                          </asp:TableRow>										
                                                     </asp:table> 
                                                <% 		
                                                }
                                                else
                                                {
                                                        %>
									                    <input name="Ret_store_visit" type="hidden" value="N" />	
									                    <%  
                                                } 
                        }    
					  else
                        {
                                %>
			                    <input name="Ret_store_visit" type="hidden" value="N" />	
			                    <%  
                        }
                        //Link to EShelf Questions
                        if (Ask_EShelf_Question == "Y")
                        {
							            %>
                                     <asp:table  runat="server" id="table9" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                             <asp:Label ID="Label26" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                             
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                     <asp:Label ID="Label27" runat="server" Text="Have you reported your EShelf information?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                                           
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                               
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="Radio_EShelf">
                                                                      <asp:ListItem   Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }
                           //*****************  Business rule 3
																		 

						if (Bus_Rule3_Question == "Y")
                        {
							            %>
                                     <asp:table  runat="server" id="table10" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          <asp:Label ID="Label28" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                             
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                   <asp:Label ID="Label41" runat="server" Text="Do you have Inventory data to report?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                                           
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                               
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR3">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }
                             //*****************  Business rule 4


                            if (Bus_Rule4_Question == "Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table11" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                        <asp:Label ID="Label39" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                             
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                    <asp:Label ID="Label30" runat="server" Text="Do you have Product Count data to report?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                                           
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                               
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR4">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }							
                             //*****************  Business rule 5


                            if (Bus_Rule5_Question == "Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table12" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                            <asp:Label ID="Label31" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                             
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                   <asp:Label ID="Label32" runat="server" Text="Do you have OOS to report?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                            
                                                                          
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                              
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR5">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }							
                             //*****************  Business rule 6


                            if (Bus_Rule6_Question == "Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table13" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                <asp:Label ID="Label33" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                            
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                    <asp:Label ID="Label34" runat="server" Text="Do you have credits to report?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                                          
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                               
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR6">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }							
                             //*****************  Business rule 7


                            if (Bus_Rule7_Question == "Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table14" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                           <asp:Label ID="Label35" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                            
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                                           <asp:Label ID="Label36" runat="server" Text="Do you have Mandatory Returns to report?"  CssClass="reportCriteriaHeader"></asp:Label>             
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                              
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR7">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }
                             //*****************  Business rule 28


                            if (Bus_Rule28_Question == "Y")
                            {
							            %>
                                     <asp:table  runat="server" id="table15" BorderColor="Black"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                                            <asp:TableRow>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                        <asp:Label ID="Label37" runat="server" Text="Question:"  CssClass="selectionCriteriaItem"></asp:Label>  
                                                   </asp:TableCell>
                                                   <asp:TableCell   Width="50%" HorizontalAlign="Left" CssClass="reportCriteriaHeader">
                                                                         
                                                         <asp:Label ID="Label38" runat="server" Text="Do you have overstocks to report?"  CssClass="reportCriteriaHeader"></asp:Label>  
                                                   </asp:TableCell>
                                             </asp:TableRow>
                                             <asp:TableRow>
                                                      <asp:TableCell   Width="50%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                                                          
                                                   </asp:TableCell>
                                                    <asp:TableCell  Width="50%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                                              
                                                                      <asp:RadioButtonList   CssClass="selectionCriteriaItem" runat="server"  ID="rad_q_BR28">
                                                                      <asp:ListItem  Value="0">YES</asp:ListItem>
                                                                      <asp:ListItem  Value="1">NO</asp:ListItem>
                                                                      </asp:RadioButtonList>
                                                                    
                                                                    
                                                    </asp:TableCell>		
                                              </asp:TableRow>										
                                         </asp:table>    			
																								
							<%     					
                            }				
                            														
                // } //Ending of if (Bus_Rule22_Photo == "N")
                %>
					        <br /> 
	            <%
                if (PhotoButton=="YES" )
                {
					%>
					        <asp:Button OnClientClick="return GoToPhotoPage()" ID="Submit" runat="server" Text="Photo Upload" CssClass="Button"></asp:Button>
							<input name="UseTheCallForm" class="button" type="hidden" value="YES" />
							 
							&nbsp&nbsp
					<%
				}
				
				if (Bus_Rule22_Photo=="N")
                {
					%>
					<asp:Button   OnClientClick="return DoSubmit()" ID="Button2" runat="server" Text="NEXT >>" CssClass="Button"></asp:Button>
					&nbsp&nbsp
					<%
				}
				%>
				<asp:Button   OnClientClick="return DoSubmitBack('Button3')" ID="Button3" runat="server" Text="<< BACK" CssClass="Button"></asp:Button>
				<%
                       
								
 }  //if (Error_Flag != "Y")   

 if (PhotoButton=="YES" )
    {
		%>
		<br />
		<br />
		<asp:Label ID="Label15" runat="server" Text="To submit digital photos please continue on to Photo Upload." CssClass="reportCriteriaHeader"></asp:Label>
 
		<%
	}				    		        
%>

 <br />
 <br />
 <br />
    <asp:Label ID="SparLinkTool" runat="server"  Font-Bold="true" ForeColor="Black" SkinID="LabelBlackSkin" ></asp:Label>  
    
</center>

</asp:Content>

