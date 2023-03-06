<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" EnableViewStateMac="false" AutoEventWireup="true" CodeFile="CFProductCallForm.aspx.cs" Inherits="CFProductCallForm" Title="SPAR - Internet Call Form Input" EnableViewState="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript"  language="javascript">
//Disable right mouse click Script
//By Maximus (maximus@nsimail.com) w/ mods by DynamicDrive
//For full source code, visit http://www.dynamicdrive.com

var message="";

///////////////////////////////////
function clickIE4(){
if (event.button==2){
alert(message);
return false;
}
}

function clickNS4(e){
if (document.layers||document.getElementById&&!document.all){
if (e.which==2||e.which==3){
//alert(message);
return false;
}
}
}

if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
}
else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}

document.oncontextmenu=new Function("return false")
//function right(e) {
//if (navigator.appName == 'Netscape' && (e.which == 3 || e.which == 2))
//{
//alert("Sorry, you do not have permission to right click.");
//return false;
//}
//else if (navigator.appName == 'Microsoft Internet Explorer' && 
//(event.button == 2 || event.button == 3)) {
//alert("Sorry, you do not have permission to right click.");
//return false;
//}
//return true;
//}
//document.onmousedown=right;
//document.onmouseup=right;

//if (document.layers) window.captureEvents(Event.MOUSEDOWN);
//if (document.layers) window.captureEvents(Event.MOUSEUP);
//window.onmousedown=right;
//window.onmouseup=right;

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

function DisableButtons()
	{
	     //******* Disabled the buttons
		
		//ctl00$ContentPlaceHolder1$Button2" value="Next >>"
		document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true;
		document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='ButtonDisabledJava'; 
        //ctl00$ContentPlaceHolder1$Button5" value="&lt;&lt; Back"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=true;
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='ButtonDisabledJava'; 
        //ctl00$ContentPlaceHolder1$Button6" value="Reset"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=true;
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.className='ButtonDisabledJava'; 
        //ctl00$ContentPlaceHolder1$Button7" value="Call Form Completed"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=true;
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.className='ButtonDisabledJava'; 

	}
function AbleButtons()
	{
	         StrCallFormEnded=document.aspnetForm.CallFormEnded.value;	
	        // alert("StrCallFormEnded=" + StrCallFormEnded)
	     if (StrCallFormEnded=="")
		      {
		           //ctl00$ContentPlaceHolder1$Button2" value="Next >>"
		            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false;
		            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='Button'; 
                    //ctl00$ContentPlaceHolder1$Button5" value="&lt;&lt; Back"
                    document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=false;  
                    document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='Button';  
		      }
	  
        //ctl00$ContentPlaceHolder1$Button6" value="Reset"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.disabled=false;
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button6.className='Button'; 
        //ctl00$ContentPlaceHolder1$Button7" value="Call Form Completed"
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.disabled=false;
        document.aspnetForm.ctl00$ContentPlaceHolder1$Button7.className='Button'; 

	}
	
function Load()
{
	Store_Close=""
	//alert("Here")
	//eval("document.aspnetForm.SavedList315111.value='N0010315111,8'")  
	
	AnswersAllFromGrid=document.aspnetForm.AnswersAllFromGrid.value
    //alert("AnswersAllFromGrid=" + AnswersAllFromGrid)
	
	if (AnswersAllFromGrid!="") 
		{
		                    CallFormEnded=document.aspnetForm.CallFormEnded.value;
	                        if (CallFormEnded=='Y')
	                        {
		                        document.aspnetForm.AnyProduct_answered.value=''
		                    }
		                    else
		                    {
		                        document.aspnetForm.AnyProduct_answered.value='Y'
		                    }
								//alert("AnswerStr=" + AnswerStr)
								AnswerArray = AnswersAllFromGrid.split("|");
								arraylength = AnswerArray.length
								//alert("arraylength=" + arraylength) 
								arraylength=eval(arraylength)
	
							for ( i = 0 ; i < arraylength ; i++ )
								{
									AnswerElement = AnswerArray[i].valueOf()
									//alert("AnswerElement=" + AnswerElement)
									Anstype = AnswerElement.substring(0,1)
									//alert("Anstype=" + Anstype)
									
									POS=AnswerElement.indexOf(",")
									//alert("POS=" + POS);
									POS2=POS-6
										
									ElementName=AnswerElement.substring(5,POS)
									//alert("ElementName=" + ElementName);
										
									
									NameOfSave="SavedList" + ElementName
									// alert("NameOfSave=" + NameOfSave)
								
										 AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
										// alert("AnswerSaveForProd=" + AnswerSaveForProd)
										if (AnswerSaveForProd=="")
											{
												eval("document.aspnetForm." + NameOfSave + ".value='" + AnswerElement + "'")
											}
										else	
											{
												//For Product
											
														ProdWithAnswerBack =eval("document.aspnetForm." + NameOfSave + ".value")
														FinalProdWithAnswer="" + ProdWithAnswerBack + "|" + AnswerElement + ""
														eval("document.aspnetForm." + NameOfSave + ".value='" + FinalProdWithAnswer + "'")
											}
											
										
									  AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
									  //alert("AnswerSaveForProd=" + AnswerSaveForProd)
								}
			
		}
		else
		{
		    Reported_Product_Answers()
		}
	
	 CallFormEnded=document.aspnetForm.CallFormEnded.value;
	 if (CallFormEnded=='Y')
	 {
	        HardCode_Question_Check()
	 }
	//Gets the color for questions that are answered
	 GetMenuColorBack()
	 Get_Mandatory_Product_color()
	
}



function Reported_Product_Answers()
{

                         //This is for call form ended on next question 999
                         Procedure_CallFormEnded_List=document.aspnetForm.Procedure_CallFormEnded_List.value
                         //alert("Procedure_CallFormEnded_List=" + Procedure_CallFormEnded_List) 
                         if (Procedure_CallFormEnded_List!="")
                         {
                                 CF_End_Array=Procedure_CallFormEnded_List.split("_");
                                 CallFormEnded=CF_End_Array[0].valueOf()
                                 CFEnd_Seq_no=CF_End_Array[1].valueOf()
                                 CFEnd_DropMenu_val=CF_End_Array[2].valueOf()
                                 CFEnd_Q_no_999=CF_End_Array[3].valueOf()
                                 CFEnd_Ans_val_999=CF_End_Array[4].valueOf()

                                 document.aspnetForm.Q_no_999.value=CFEnd_Q_no_999;
                                 document.aspnetForm.Ans_val_999.value=CFEnd_Ans_val_999;
                                 //alert("CallFormEnded=" + CallFormEnded) 
                                 //alert("CFEnd_Seq_no=" + CFEnd_Seq_no) 
                                 //alert("CFEnd_DropMenu_val=" + CFEnd_DropMenu_val) 
                                 
                                 document.aspnetForm.CFEnd_SelectedProduct.value=CFEnd_DropMenu_val;
                                 document.aspnetForm.CallFormEnded.value=CallFormEnded;
                                 CallFormEnded=document.aspnetForm.CallFormEnded.value;
	                               if (CallFormEnded=='Y')
	                                {
		                                document.aspnetForm.AnyProduct_answered.value=''
		                            }
		                           else
		                            {
		                                 document.aspnetForm.AnyProduct_answered.value='Y'
		                            }
		                    
		                 }   
		                 
                         All_Seq_no_List=document.aspnetForm.ProcedureMenu_Array_no.value
                         // alert("All_Seq_no_List=" + All_Seq_no_List) 
                         if (All_Seq_no_List!="") 
                         {
                                         ProcedureProdNextPage=document.aspnetForm.ProcedureProdNextPage.value 
                                         document.aspnetForm.ProdAnsForNextPage.value=ProcedureProdNextPage 
                					    
					                     All_Seq_Array=All_Seq_no_List.split("|");
                                         All_Seq_length = All_Seq_Array.length
			                              //alert("QHAlength=" + QHAlength) 
			                             All_Seq_length=eval(All_Seq_length-1)
                    			
					                    for (R = 0 ; R < All_Seq_length ; R++ )
						                    {
							                    ArrEle_Seq_no=All_Seq_Array[R].valueOf()
							                    //alert("ArrEle_Seq_no=" + ArrEle_Seq_no) 
                							      Menu_Seq_Array=ArrEle_Seq_no.split("_");
                							      Menu_option_No=Menu_Seq_Array[0].valueOf()
                							     //alert("Menu_option_No=" + Menu_option_No)
                							      
                							      Item_Seq_no=Menu_Seq_Array[1].valueOf()
                							      // alert("Item_Seq_no=" + Item_Seq_no)
                							      
							                     NameOfReport="ReportedList" + Item_Seq_no
							                     //alert("NameOfReport=" + NameOfReport)
                						         
						                         //reportList from the procedure
								                 ReportedList_Ans =eval("document.aspnetForm." + NameOfReport + ".value")
								                 //alert("ReportedList_Ans=" + ReportedList_Ans)
                								 
								                 if (ReportedList_Ans!="")
								                 {
								                             //Setting up the saveList..... Savelist is a hidden variable for answer for each product SavedList2
							                                  NameOfSavedList="SavedList" + Item_Seq_no
								                              //alert("NameOfSavedList=" + NameOfSavedList)
                            								  
								                              eval("document.aspnetForm." + NameOfSavedList + ".value='" + ReportedList_Ans  + "'")
                            								  
								                              //Give menu a color
								                              NameOfMenuColor="ProductColor" + Item_Seq_no
									                             //alert("NameOfMenuColor=" + NameOfMenuColor)
                            							
								                                Hidden_val_ForColor =eval("document.aspnetForm." + NameOfMenuColor + ".value")
								                               // alert("Hidden_val_ForColor=" + Hidden_val_ForColor)
                            						
                            									 
								                               eval("document.aspnetForm." + NameOfMenuColor + ".value='" + Menu_option_No + "'")
                            								 
                            													
								                              document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[Menu_option_No].style.backgroundColor = 'Deepskyblue'
								                    }          
                							    
							                }
                           }//if (All_Seq_no_List!="") 
} 


function HardCode_Question_Check()
{
	 
	 		    SelectedProduct=document.aspnetForm.CFEnd_SelectedProduct.value;	
	            document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=SelectedProduct
		        DisplayCallForm()	 
				document.aspnetForm.EnterProduct.disabled=true
                //next button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='ButtonDisabledJava'; 
	            //Back button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=true
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='ButtonDisabledJava'; 
	            //Back drop menu
			    document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.disabled=true															 
}

function GetMenuColorBack()
{
	//alert("Here")
	//eval("document.aspnetForm.SavedList315111.value='N0010315111,8'")  
	
	AnswersForMenuColor=document.aspnetForm.AnswersForMenuColor.value
	 //alert("AnswersForMenuColor=" + AnswersForMenuColor)
	
	if (AnswersForMenuColor!="") 
		{
								//alert("AnswerStr=" + AnswerStr)
						ColorArray = AnswersForMenuColor.split("|");
						arraylen = ColorArray.length
						//alert("arraylen=" + arraylen) 
						arraylen=eval(arraylen)
	
							for ( j = 0 ; j < arraylen ; j++ )
								{
											Element = ColorArray[j].valueOf()
											 //alert("Element=" + Element)

											POS=Element.indexOf(",")
											//alert("POS=" + POS);

											ElementID=Element.substring(0,POS)
											 //alert("ElementID=" + ElementID);
												
											POS2=Element.length
											//alert("POS2=" + POS2);	
									
											MenuOption=Element.substring(POS+1,POS2)
											 //alert("MenuOption=" + MenuOption);

											NameOfEleColor="ProductColor" + ElementID
											//alert("NameOfEleColor=" + NameOfEleColor)
									
											AnswerSaveForColor =eval("document.aspnetForm." + NameOfEleColor + ".value")
											//alert("AnswerSaveForColor=" + AnswerSaveForColor)
									
												if (AnswerSaveForProd!="")
													{
														eval("document.aspnetForm." + NameOfEleColor + ".value='" + MenuOption + "'")
													}
											AnswerSaveForColor =eval("document.aspnetForm." + NameOfEleColor + ".value")
											//alert("AnswerSaveForColor=" + AnswerSaveForColor)
											
											//Give menu a color
											document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[MenuOption].style.backgroundColor = 'Deepskyblue'
							
								}//Ending of the for loop
			
		}


}
function Get_Mandatory_Product_color()
{

	 MP_Array=document.aspnetForm.Array_Mandatory_products.value
     //alert("MP_Array=" + MP_Array)
	MT_ProdId=document.aspnetForm.Array_Mandatory_ProdId.value
	// alert("MT_ProdId=" + MT_ProdId)
	if (MP_Array!="") 
		{
								//alert("AnswerStr=" + AnswerStr)
								
						MT_ProdIdArray = MT_ProdId.split("|");
						ColorArray = MP_Array.split("|");
						arraylen = ColorArray.length
						// alert("arraylen=" + arraylen) 
						arraylen=eval(arraylen-1)
	
							for ( j = 0 ; j < arraylen ; j++ )
								{
								
											MenuOption = ColorArray[j].valueOf()
											// alert("MenuOption=" + MenuOption)
											 
											 MP_AllProd_val = MT_ProdIdArray[j].valueOf()
											// alert("MP_AllProd_val=" + MP_AllProd_val)
											 
											 
 
                                            NameOfEleColor="ProductColor" + MP_AllProd_val
											// alert("NameOfEleColor=" + NameOfEleColor)
//									           NameOfSave="SavedList" + MenuOption
//			                                    AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
//			                                    alert("AnswerSaveForProd=" + AnswerSaveForProd)
//			
											AnswerSaveForColor =eval("document.aspnetForm." + NameOfEleColor + ".value")
											
									
												if (AnswerSaveForColor=="")
													{
													   // alert("inside=" + AnswerSaveForColor)
													      
                                                        document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[MenuOption].style.backgroundColor = 'Yellow' 
														         
														//document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[MenuOption].className ="DDDMandatoryProductJava";
														 //var colr = ddl.options[ddl.selectedIndex].value;
                                                          //ddl.style.backgroundColor ='Yellow'
													}
	
								}//Ending of the for loop
			
		}
}


//**************************************** Search for product 
function ProdSearch()
{


	 //alert("test....") //
	if (event.keyCode==13)
	{		
			  
                    //Save the questions 
                             GetSavedProd=document.aspnetForm.ControlList.value         
                             //alert("GetSavedProd=" + GetSavedProd );
                             if (GetSavedProd!="")
					                {
						                //This function check if any questions answered then you have to answer each question.	
						                if (AnyQuestionAnswered(GetSavedProd)==false)
							                {
								                if (Validation(GetSavedProd)==false)
										                {
											                 ItemNumber =document.aspnetForm.Menu_id.value;
											                  //alert("ItemNumber=" + ItemNumber)
											                 document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=ItemNumber
											                return false;
										                }
							                }
                						
						                 SaveAnswers(GetSavedProd)
						                //alert("ErrorOccurred=" + ErrorOccurred)
					                }
					//TextProdNumber=Must_Be_Answered_Prod_Enter_Box()
					//alert("dfsdfsdfsd=" + TextProdNumber)
					//if (TextProdNumber=="")
					//	{
							TextProdNumber = document.aspnetForm.EnterProduct.value
							 //alert("TextProdNumber=" + TextProdNumber)
					//	}
					//else
					//	{
					//		document.QGrid.EnterProduct.value=TextProdNumber
					//	}
				
			//alert("out")
			ItemNumber="";
			NumberOfProd=document.aspnetForm.TotalProdCount.value
		   // alert("NumberOfProd=" + NumberOfProd)

					if (isNaN(TextProdNumber)==true)
						{
							//alert("Product number has to be numeric.")
							alert('<%=vPrompts[0]%>');
							event.returnValue = false;
							return false;
						}
					
					ItemFound="NO"
					AllProdNames=document.aspnetForm.AllProdNames.value
					
					  AllProdArray=AllProdNames.split("|");
                    AllProdlength = AllProdArray.length
			         //alert("QHAlength=" + QHAlength) 
			        AllProdlength=eval(AllProdlength)
			
					for ( y = 0 ; y < AllProdlength ; y++ )
						{
						 
							ItemNumber=AllProdArray[y].valueOf()

							//alert("ItemNumber=" + ItemNumber)
							//alert("TextProdNumber=" + TextProdNumber)
							if (eval(ItemNumber)==eval(TextProdNumber))
								{
									        ItemFound="YES"
									        //alert("y=" + y)
									        //alert("It's there")
									        //alert("ItemNumber=" + ItemNumber)
										    ItemNumber=ItemNumber-1;
										    //alert("ItemNumber=" + ItemNumber)
										    document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=y
										    DisplayCallForm()
										 
													
											/* With this you can focus on a element.*/
											FocusType="TextBox"
											ElementOnFocus(FocusType)
										
										event.returnValue = false;
									break;
								}
						}
	
					if (ItemFound=="NO")
						{
							//alert("Product number " + TextProdNumber + " doesn't exist.")
							alert("<%=vPrompts[1]%> " + TextProdNumber + " <%=vPrompts[2]%>");
							
							event.returnValue = false;
							return false;
						}

		event.returnValue = false;
	}
}		
//**************************************** Main Function Display the call form	
function DisplayCallForm()
{
    //Value from drop down menu
    if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '999999' )
	{
		//alert("Please select Product from the menu or enter a product number.")
		 alert('<%=vPrompts[3]%>')
		 return false;
	}
	else
	{     
            SelectedProduct=document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value;
            //alert("SelectedProduct=" + SelectedProduct ); 
    }  
             var ddl = document.getElementById("<%=SelectedProduct.ClientID%>");
 	         var colr = ddl.options[ddl.selectedIndex].value;
             ddl.style.backgroundColor =document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[ddl.selectedIndex].style.backgroundColor;
       
             document.aspnetForm.EnterProduct.value='';       
    //Save the questions 
             GetSavedProd=document.aspnetForm.ControlList.value         
             //alert("GetSavedProd=" + GetSavedProd );
             if (GetSavedProd!="")
					{
						//This function check if any questions answered then you have to answer each question.	
						if (AnyQuestionAnswered(GetSavedProd)==false)
							{
								if (Validation(GetSavedProd)==false)
										{
											 ItemNumber =document.aspnetForm.Menu_id.value;
											  //alert("ItemNumber=" + ItemNumber)
											 document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=ItemNumber
											return false;
										}
							}
						
						 SaveAnswers(GetSavedProd)
						//alert("ErrorOccurred=" + ErrorOccurred)
					}
             
    //Get header info  
            CFHeaderInfo=document.aspnetForm.CFHeaderInfo.value;
            //alert("CFHeaderInfo=" + CFHeaderInfo );
            HeaderArray=CFHeaderInfo.split("~");
            HeaderArrayValue = HeaderArray[SelectedProduct].valueOf()
            //alert("HeaderArrayValue=" + HeaderArrayValue );
            Loc=HeaderArrayValue.indexOf("-")
			Prod_id=HeaderArrayValue.substring(0,Loc) 
            //alert("Prod_id=" + Prod_id);
            StrHeaderArrayValue='<%=vPrompts[84]%>' + " " + HeaderArrayValue;
            ProdHeader.innerHTML=StrHeaderArrayValue;
    
      //*** Question Header Array
            CFQuestionInfo=document.aspnetForm.CFQuestionInfo.value;
            //alert("CFQuestionInfo=" + CFQuestionInfo );
            QuestionArray=CFQuestionInfo.split("||");
            QuestionArrayValue = QuestionArray[SelectedProduct].valueOf()
             //alert("QuestionArrayValue=" + QuestionArrayValue );

    //Get the Question CFHdrAnsInfo

            QHeaderArray=QuestionArrayValue.split("|");
            //alert("QHeaderArray=" + QHeaderArray) 
            QHAlength = QHeaderArray.length
			 //alert("QHAlength=" + QHAlength) 
			QHAlength=eval(QHAlength)
				
			HTMLText="";
			Answer_Type="";
			ControlName=""; 
			HTMLText=HTMLText + "<table border='1' width='100%'  bordercolor='dodgerblue'>";
			RCA=0 					
            for ( i = 0 ; i < QHAlength ; i++ )
				{
                     QuestionElement = QHeaderArray[i].valueOf()
					  //alert("QuestionElement=" + QuestionElement) 
					 
					 POS=QuestionElement.indexOf("_")
					 StrQ_no=QuestionElement.substring(0,POS) 
					 
					 Poslen=QuestionElement.length;
                     ArrayHigh=QuestionElement.substring(POS+1,Poslen) 
                     // alert("ArrayHigh=" + ArrayHigh) 
                     PosH=ArrayHigh.indexOf("_")
                     //alert("PosH=" + PosH) 
                     High_Val=ArrayHigh.substring(0,PosH) 
                     if (High_Val!="")
                        {
                            High_Val=Number(High_Val)
                            
                        } 
                     // alert("High_Val=" + High_Val) 
					 PosEnd=ArrayHigh.length;
                     Low_Val=ArrayHigh.substring(PosH+1,PosEnd) 
                     if (Low_Val!="")
                        {
                              Low_Val=Number(Low_Val)
                              //alert("Low_Val=" + Low_Val) 
                        }
                      //alert("Low_Val=" + Low_Val) 
					 //Get question header for hidden variable
					 
					 QHName="Q" + StrQ_no
					 QuestionText=eval("document.aspnetForm." + QHName + ".value")
					 //alert("QuestionText=" + QuestionText) 
					 
					 POS=QuestionText.indexOf("_")
					 Ans_Type=QuestionText.substring(0,POS) 
					 //alert("Ans_Type=" + Ans_Type) 
					 poslen=QuestionText.length;
                    // alert("poslen=" + poslen);
                     Q_Text=QuestionText.substring(POS+1,poslen)
                    // alert("Q_Text=" + Q_Text);
                     
					 DisplayQ_text=StrQ_no + " - " + Q_Text
					  if (Ans_Type=="C")
					  {
					        Answer_Type='<%=vPrompts[85]%>';
					        ControlName=ControlName + "C" + StrQ_no + "0" + Prod_id + "|";
					  }
					  if (Ans_Type=="D")
					  {
					        Answer_Type='<%=vPrompts[89]%>';
					        DateRule=document.aspnetForm.DateRule.value;
					        Answer_Type=Answer_Type.replace("mm/dd/yyyy",DateRule)
					        //alert("Answer_Type=" + Answer_Type);
					        //mm/dd/yyyy
					        ControlName=ControlName + "D" + StrQ_no + "0" + Prod_id + "|";
					  }
					  if (Ans_Type=="N")
					  {
					        Answer_Type='<%=vPrompts[90]%>';
					        ControlName=ControlName + "N" + StrQ_no + "0" + Prod_id + "|";
					  }
					  if (Ans_Type=="T")
					  {
					       Answer_Type='<%=vPrompts[88]%>';
					       ControlName=ControlName + "T" + StrQ_no + "0" + Prod_id + "|";
					  }
					 if (Ans_Type=="L" || Ans_Type=="R" )
					  {
					        Answer_Type='<%=vPrompts[86]%>';
					        if (Ans_Type=="L")
					        {
					            ControlName=ControlName + "L" + StrQ_no + "0" + Prod_id + "|";
					        }
					        if (Ans_Type=="R")
					        {
					            ControlName=ControlName + "R" + StrQ_no + "0" + Prod_id + "|";
					        }
					  }
					   if (Ans_Type=="P" || Ans_Type=="M" || Ans_Type=="H" )
					  {
					    Answer_Type='<%=vPrompts[87]%>';
					        if (Ans_Type=="P")
					            {
					                 ControlName=ControlName + "P" + StrQ_no + "0" + Prod_id + "|";
					                 ControlName=ControlName + "P" + StrQ_no + "1" + Prod_id + "|";
					            }
					        if (Ans_Type=="M")
					            {
					                 ControlName=ControlName + "M" + StrQ_no + "0" + Prod_id + "|";
					                 ControlName=ControlName + "M" + StrQ_no + "1" + Prod_id + "|";
					            }
					        if (Ans_Type=="H")
					            {
					                 ControlName=ControlName + "H" + StrQ_no + "0" + Prod_id + "|";
					                 ControlName=ControlName + "H" + StrQ_no + "1" + Prod_id + "|";
					            }
					  }
	                 HTMLText=HTMLText + "<tr>";
	                 HTMLText=HTMLText + "<td class='selectionCriteriaItem'>QNo.</td>";
	                 HTMLText=HTMLText + "<td ><table border='1' width='100%'  bordercolor='white'><tr><td  class='selectionCriteriaItem' bordercolor='dodgerblue' width='50%'><B>" + DisplayQ_text + "<span style='color:red;'> " + Answer_Type + " </span></B></td><td class='selectionCriteriaItem'  bordercolor='dodgerblue' width='50%'><span style='color:black;'><%=vPrompts[111]%></span></td></tr></table></td>";
	                // HTMLText=HTMLText + "<td class='selectionCriteriaItem' width='50%'><B><span style='color:red;'>Response</span></B></td>";
	                 HTMLText=HTMLText + "</tr>";
	                 
	                 HTMLResponseText=GetQuestionResponse(Ans_Type,StrQ_no,Prod_id,High_Val,Low_Val)
	                 HTMLText=HTMLText + "" + HTMLResponseText  
                }
                 HTMLText=HTMLText + "</Table>";
                 //Controls names save for current call form for a product 
                    document.aspnetForm.ControlList.value=ControlName
                    document.aspnetForm.Menu_id.value=SelectedProduct 
                    document.aspnetForm.Prod_id.value=Prod_id   
                //Display the call form    
                 //alert("HTMLText=" + HTMLText);   
                    ProdQuestion.innerHTML=HTMLText;
                //Display the answers    
                    DisplayAnswers(Prod_id)
                    
                
                    
}

//**************************************** Get the responses for each question 
function GetQuestionResponse(Ans_Type,StrQ_no,Prod_id,High_Val,Low_Val)
{
//     alert("High_Val=" + High_Val)
//     alert("Low_Val=" + Low_Val)
   DateRule=document.aspnetForm.DateRule.value;
   Ilang_id=document.aspnetForm.ILang_Id.value	 
  //  alert("Ilang_id=" + Ilang_id)
    
    RTname="R" + StrQ_no
    ResponseText=eval("document.aspnetForm." + RTname + ".value")
	//alert("ResponseText=" + ResponseText)
	 
	RTArray=ResponseText.split("|");
    RTlength = RTArray.length
	// alert("RTlength=" + RTlength) 
	RTlength=eval(RTlength)
	RTlength=RTlength-1;
	
	
    HTML_Ele=""; 
    HTML_Ele=HTML_Ele + "<tr>";
	HTML_Ele=HTML_Ele + "<td class='selectionCriteriaItem'>Ans</td>";
	HTML_Ele=HTML_Ele + "<td>";
	HTML_Ele=HTML_Ele + "<Table border='1' width='100%'  bordercolor='dodgerblue'>";  
	 
   	
	                for ( q = 0 ; q < RTlength ; q++ )
	                   {	 
	                             RTArrayText = RTArray[q].valueOf()
				                 //alert("RTArrayText=" + RTArrayText) 
                					  
	                             //************** get answer values
	                             POS=RTArrayText.indexOf("_")
	                             Ans_Val=RTArrayText.substring(0,POS) 
	                            // alert("Ans_Val=" + Ans_Val) 
                                 //************** get response text			 
	                             poslen=RTArrayText.length;
	                             RTArrayText=RTArrayText.substring(POS+1,poslen) 
	                             //alert("RTArrayText=" + RTArrayText) 
	                             POS2=RTArrayText.indexOf("_")
	                             Ans_Text=RTArrayText.substring(POS-1,POS2) 
	                            // alert("Ans_Text=" + Ans_Text) 
	                             
	                             Nxt_Q_No=RTArrayText.substring(POS2+1,poslen) 
	                             //alert("Nxt_Q_No=" + Nxt_Q_No) 
	                             StrItems="";
	                             StrOnlick="";
	                             StrItems="'" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "'";
	                             StrItemKey="'event'";
	                             
                                 //alert("StrItems=" + StrItems);
                                 StrOnlick='onclick="SkipPattern(' + StrItems + ')"';
                                 StrOnkeyDate='onkeypress="return DateNumberOnly(' + StrItemKey + ')"';
                                 StrOnkeyNumber='onkeypress="return NumberOnly(' + StrItemKey + ')"';
                                 StrOnlickTypeT='onchange="SkipPattern(' + StrItems + ')"';
                                  StrOnkeyText='onkeypress="return TextCheckOnly(' + StrItemKey + ')"';
	                            // alert("StrOnlick=" + StrOnlick); 
	                             
	                              if (Ans_Type=="C")
                                    {
                                        StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                       //  HTML_Ele=HTML_Ele + "<INPUT type='checkbox' name='C" + StrQ_no + "0" + Prod_id + "' id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' onclick=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "<div id='rad_Span" + StrQ_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='checkbox' name='C" + StrQ_no + "0" + Prod_id + "' id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' " + StrOnlick + "></div><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>";
	                                }
	                              if (Ans_Type=="L")
                                    {
                                        StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
	                                     //HTML_Ele=HTML_Ele + "<Span id='rad_Span" + StrQ_no + "0" + Prod_id + "" + q + "'>";
				                        // HTML_Ele=HTML_Ele + "<INPUT type='radio' name='L" + StrQ_no + "0" + Prod_id + "'  id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' onclick=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "<div id='rad_Span" + StrQ_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='radio' name='L" + StrQ_no + "0" + Prod_id + "'  id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' " + StrOnlick + "></div><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>";
	                                }
	                              if (Ans_Type=="R")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "" + Ans_Val + "'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                        // HTML_Ele=HTML_Ele + "<INPUT type='radio' name='R" + StrQ_no + "0" + Prod_id + "' id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' onclick=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "<div id='rad_Span" + StrQ_no + "0" + Prod_id + "" + q + "' style='width:20px;float:left;'>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='radio' name='R" + StrQ_no + "0" + Prod_id + "' id='N," + High_Val + "," + Low_Val + "' value='" + Ans_Val + "' " + StrOnlick + "></div><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }
	                              if (Ans_Type=="T")
                                    {
                                             StrItemT="";
	                                         StrOnlickT="";
	                                         StrItemT="'Counter" + StrQ_no + "','T" + StrQ_no + "0" + Prod_id + "'";
                                             //alert("StrItemT=" + StrItemT);
                                             StrOnlickT='onkeyup="EnterText(' + StrItemT + ')"';
	                                         //alert("StrOnlickT=" + StrOnlickT);
	                                     StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
	                                         
                                         //onkeyup=`EnterText('Counter" + StrQ_no + "','T" + StrQ_no + "0" + Prod_id + "')`
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
	                                     //HTML_Ele=HTML_Ele + "<INPUT type='text' name='T" + StrQ_no + "0" + Prod_id + "'  size=100 maxlength=100 id='N," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')` onkeyup=`EnterText('Counter" + StrQ_no + "','T" + StrQ_no + "0" + Prod_id + "')`><span style='color:red;'></span>" + Ans_Text + "";
	                                    if ((Ilang_id=="2")||(Ilang_id=="4"))
	                                    {
	                                        HTML_Ele=HTML_Ele + "<INPUT type='text' name='T" + StrQ_no + "0" + Prod_id + "'  size=90 maxlength=600 id='N," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + " " + StrOnlickT + " " + StrOnkeyText + "><span style='color:red;'></span>" + Ans_Text + "";
				                            HTML_Ele=HTML_Ele + "<BR>Character Count - 600 maximum <input type='text' name='Counter" + StrQ_no + "' size='1' style='background-color: #E0E0E0' disabled>";
	                                    }
	                                    else
	                                    {
	                                        HTML_Ele=HTML_Ele + "<INPUT type='text' name='T" + StrQ_no + "0" + Prod_id + "'  size=90 maxlength=300 id='N," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + " " + StrOnlickT + " " + StrOnkeyText + "><span style='color:red;'></span>" + Ans_Text + "";
				                            HTML_Ele=HTML_Ele + "<BR>Character Count - 300 maximum <input type='text' name='Counter" + StrQ_no + "' size='1' style='background-color: #E0E0E0' disabled>";
				                         }
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem'  width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }
	                                if (Ans_Type=="N")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
                                         
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                        // HTML_Ele=HTML_Ele + "<INPUT type='text' name='N" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=12 id='N," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "<INPUT type='text' name='N" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N," + High_Val + "," + Low_Val + "'  " + StrOnlickTypeT + " " + StrOnkeyNumber + "><span style='color:red;'></span>" + Ans_Text + "";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }
	                                if (Ans_Type=="D")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                         //HTML_Ele=HTML_Ele + "<INPUT type='text' name='D" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=12 id='N," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'>" + DateRule + "</span>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='text' name='D" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=12 id='D," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + " " + StrOnkeyDate + "><span style='color:red;'>" + DateRule + "</span>";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }	
	                                 if (Ans_Type=="P")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                         //HTML_Ele=HTML_Ele + "<INPUT type='text' name='P" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,D," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[94]%></span>";
				                         //HTML_Ele=HTML_Ele + " <INPUT type='text' name='P" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,C," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[95]%></span>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='text' name='P" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,D," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[94]%></span>";
				                         HTML_Ele=HTML_Ele + " <INPUT type='text' name='P" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,C," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[95]%></span>";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }		
	                                 if (Ans_Type=="M")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                         //HTML_Ele=HTML_Ele + "<INPUT type='text' name='M" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,F," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[96]%></span>";
				                         //HTML_Ele=HTML_Ele + " <INPUT type='text' name='M" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,I," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[97]%></span>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='text' name='M" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,F," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[96]%></span>";
				                         HTML_Ele=HTML_Ele + " <INPUT type='text' name='M" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,I," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[97]%></span>";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }		
	                                 if (Ans_Type=="H")
                                    {
                                         StrDisplay_Ans_Text="<B><Span style='color:green;' id='Show_Res_Text" + StrQ_no + "0" + Prod_id + "0'></span></B>";
	                                     HTML_Ele=HTML_Ele + "<tr><td class='selectionCriteriaItem' width='50%'>";
				                         //HTML_Ele=HTML_Ele + "<INPUT type='text' name='H" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,H," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[98]%></span>";
				                        // HTML_Ele=HTML_Ele + " <INPUT type='text' name='H" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,M," + High_Val + "," + Low_Val + "' onchange=`SkipPattern('" + Nxt_Q_No + "','" + StrQ_no + "','QList" + Prod_id + "')`><span style='color:red;'><%=vPrompts[99]%></span>";
				                         HTML_Ele=HTML_Ele + "<INPUT type='text' name='H" + StrQ_no + "0" + Prod_id + "'  size=10 maxlength=8 id='N,H," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[98]%></span>";
				                         HTML_Ele=HTML_Ele + " <INPUT type='text' name='H" + StrQ_no + "1" + Prod_id + "'  size=10 maxlength=2 id='N,M," + High_Val + "," + Low_Val + "' " + StrOnlickTypeT + "  " + StrOnkeyNumber + "><span style='color:red;'><%=vPrompts[99]%></span>";
				                         HTML_Ele=HTML_Ele + "</td><td class='selectionCriteriaItem' width='50%'>" + StrDisplay_Ans_Text + "</td></tr>"; 
	                                }								   
                         }
    //return false;
    HTML_Ele=HTML_Ele + "</Table>";
	HTML_Ele=HTML_Ele + "</td>";
	HTML_Ele=HTML_Ele + "</tr>";
	 //alert("HTML_Ele=" + HTML_Ele) 
	
    return HTML_Ele;	   
}
//******************************************Next Button 

function NextProduct()
{
	             if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '999999' )
	                {
		                //alert("Please select Product from the menu or enter a product number.")
		                 alert('<%=vPrompts[3]%>')
		                 return false;
	                }
       
                     MenuVal="";
                     ProdCheck="";
	                 GetSavedProd=document.aspnetForm.ControlList.value 
	                 //alert("GetSavedProdNext=" + GetSavedProd)
	                /* With function you can save the value for the page before*/

		            SelectedProduct=document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value;	
					//document.aspnetForm.EnterProduct.value=''
	               //alert("SelectedProduct=" + SelectedProduct)
	                ProdCheck=eval(SelectedProduct) + 1;
			        NumberOfProd=document.aspnetForm.TotalProdCount.value
			       //alert("NumberOfProd=" + NumberOfProd)
			        if (NumberOfProd==1)
		             {
		                 alert('<%=vPrompts[4]%>' + " \n " + '<%=vPrompts[58]%>')
			            return false;
		             }
		             if (eval(ProdCheck)==eval(NumberOfProd))
					    {	
						    //alert("This is the last product in the list.\n You can not use the NEXT button any more.")
						    alert('<%=vPrompts[4]%>' + " \n " + '<%=vPrompts[58]%>')
						                    if (GetSavedProd!="")
		                                        {
			                                        //This function check if any questions answered then you have to answer each question.	
			                                         if (AnyQuestionAnswered(GetSavedProd)==false)
				                                          {
					                                        if (Validation(GetSavedProd)==false)
					            	                            {
					            		                            return false;
					            	                            }
				                                        }
			                                            SaveAnswers(GetSavedProd)	
		                                        }
		                                  if (Must_Be_Answered_Prod()==false)
		                                        {
			                                        return false;
		                                        }
		                                  return false;
					    }
					else
					    {		
					           // alert("SelectedProduct=" + SelectedProduct ); 
					            MenuVal=eval(SelectedProduct) + 1;
					            document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=MenuVal;
                                // alert("SelectedProduct=" + SelectedProduct ); 
                                DisplayCallForm()     
                        }
	
				/* This function focus on the first element of the grid.*/
					FocusType="NextProduct"
					ElementOnFocus(FocusType)	
					 
	 
	return false;
}
//******************************************Back Button 

function BackProduct()
{
	                 if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '999999' )
	                        {
		                        //alert("Please select Product from the menu or enter a product number.")
		                         alert('<%=vPrompts[3]%>')
		                         return false;
	                        }
       
                     MenuVal="";
	                 GetSavedProd=document.aspnetForm.ControlList.value 
	                 //alert("GetSavedProdNext=" + GetSavedProd)
	               
			       
		            SelectedProduct=document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value;	
					//document.aspnetForm.EnterProduct.value=''
	                 //alert("SelectedProduct=" + SelectedProduct)
	                
			        NumberOfProd=document.aspnetForm.TotalProdCount.value
			        //alert("NumberOfProd=" + NumberOfProd)
			        if (NumberOfProd==1)
		             {
		                alert('<%=vPrompts[5]%>' + " \n " + '<%=vPrompts[59]%>')
			            return false;
		             }
		             if (eval(SelectedProduct)==0)
					    {	
						            //alert("This is the last product in the list.\n You can not use the NEXT button any more.")
						            alert('<%=vPrompts[5]%>' + " \n " + '<%=vPrompts[59]%>')
						             /* With function you can save the value for the page before*/
                        	
	                                        if (GetSavedProd!="")
		                                        {
			                                        //This function check if any questions answered then you have to answer each question.	
			                                         if (AnyQuestionAnswered(GetSavedProd)==false)
				                                          {
					                                        if (Validation(GetSavedProd)==false)
					            	                            {
					            		                            return false;
					            	                            }
				                                        }
			                                            SaveAnswers(GetSavedProd)	
		                                        }
		                                        if (Must_Be_Answered_Prod()==false)
		                                            {
			                                        return false;
		                                        }
		                                  return false;
						    
					    }
					else
					    {		
					            MenuVal=eval(SelectedProduct) - 1;
					            document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=MenuVal;
                                // alert("SelectedProduct=" + SelectedProduct ); 
                                  DisplayCallForm()
                        }
	
				/* This function focus on the first element of the grid.*/
					FocusType="NextProduct"
					ElementOnFocus(FocusType)	
					 
		 
	return false;
}

//******************************* Remove all the answers in asked questions
function ResetProduct()
{
	        if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '1NO1' )
	            {
		            alert('<%=vPrompts[72]%>')
		            return false;
	            }
	        if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '999999' )
                {
                    //alert("Please select Product from the menu or enter a product number.")
                     alert('<%=vPrompts[3]%>')
                     return false;
                }
	 
		    ProdFromMenu=document.aspnetForm.Prod_id.value
		
			 
			ProdQNames=document.aspnetForm.ControlList.value 
			//alert("ProdQNames=" + ProdQNames)
			
			ArrayAList = ProdQNames.split("|");
			arraylength = ArrayAList.length
			 //alert("arraylength=" + arraylength) 
			 arraylength=eval(arraylength-1)
		
			for ( i = 0 ; i < arraylength ; i++ )
				{
						 ElementName = ArrayAList[i].valueOf()
						 //alert("ElementName=" + ElementName)
						 EleColor=ElementName.substring(1,ElementName.length)
                        //alert("EleColor=" + EleColor)
						Anstype = ElementName.substring(0,1)
						 //alert("Anstype=" + Anstype)
						 Q_no_Counter = ElementName.substring(1,4)
						 //alert("Q_no_Counter=" + Q_no_Counter)
						switch(Anstype)
							{
			 				case "C" :		
			 							
										k=eval("document.aspnetForm." + ElementName + ".length")
										//alert("k=" + k)	
										LenCheck=String(k)
											if (LenCheck=="undefined")
												{				
																	eval("document.aspnetForm." + ElementName + ".checked=false")	
																	eval("document.aspnetForm." + ElementName + ".disabled=false")
																	//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")	
																	StrSpanEle="rad_Span" + EleColor + "0";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")						
												}
											else
												{	
														for (j=0; j<k; j++)
																{	
																	eval("document.aspnetForm." + ElementName + "[j].checked=false")	
																	eval("document.aspnetForm." + ElementName + "[j].disabled=false")
																	//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'white'")
																	StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")							
																}
												}	
								break
							case "L" :			
										k=eval("document.aspnetForm." + ElementName + ".length")
										//alert("k=" + k)	
										LenCheck=String(k)
											if (LenCheck=="undefined")
												{				
																	eval("document.aspnetForm." + ElementName + ".checked=false")	
																	eval("document.aspnetForm." + ElementName + ".disabled=false")
																	//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
																	StrSpanEle="rad_Span" + EleColor + "0";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")						
												}
											else
												{	
														for (j=0; j<k; j++)
																{	
																	eval("document.aspnetForm." + ElementName + "[j].checked=false")	
																	eval("document.aspnetForm." + ElementName + "[j].disabled=false")
																	//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'white'")	
																	StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")					
																}
												}	
								break
						    case "R" :
										k=eval("document.aspnetForm." + ElementName + ".length")
										//alert("k=" + k)	
										LenCheck=String(k)
											if (LenCheck=="undefined")
												{				
																	eval("document.aspnetForm." + ElementName + ".checked=false")	
																	eval("document.aspnetForm." + ElementName + ".disabled=false")
																	//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")	
																	StrSpanEle="rad_Span" + EleColor + "0";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")					
												}
											else
												{	
														for (j=0; j<k; j++)
																{	
																	eval("document.aspnetForm." + ElementName + "[j].checked=false")	
																	eval("document.aspnetForm." + ElementName + "[j].disabled=false")
																	//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'white'")	
																	StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")					
																}
												}						
								break
							case "T" :
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
	
											CounterBoxName="Counter" + Q_no_Counter
											eval("document.aspnetForm." + CounterBoxName + ".value=''")
											eval("document.aspnetForm." + CounterBoxName + ".style.backgroundColor = '#E0E0E0'")
																											
								break
							case "D" :
								//alert("D")
								
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
								break
							case "N" :
								//alert("N")
									
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
								break
							case "P" :
								//alert("N")
									
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
								break
							case "M" :
								//alert("N")
									
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
								break
							case "H" :
								//alert("N")
									
											eval("document.aspnetForm." + ElementName + ".value=''")
											eval("document.aspnetForm." + ElementName + ".disabled=false")
											eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'white'")
								break
							default:
								InPutValue=""
								//alert("default")
								break
							}
				}	/*Ending of the for loop*/	
				
			NameOfSave="SavedList" + ProdFromMenu
				 //alert("NameOfSave=" + NameOfSave)
			eval("document.aspnetForm." + NameOfSave + ".value=''")
			
			GetColor(ProdFromMenu)	
			
			ProdAnsForNextPage=eval("document.aspnetForm.ProdAnsForNextPage.value")
			
			ProdAnsForNextArray = ProdAnsForNextPage.split("|");
			ProdFirstvalue = ProdAnsForNextArray[0].valueOf()	
			 //alert("ProdFirstvalue=" + ProdFirstvalue)
			//alert("arraylength=" + arraylength) 
					
		    if (ProdFromMenu==ProdFirstvalue)
		    {
		            Streplace=ProdFromMenu + "|"
		            StrProdNoReplace=ProdAnsForNextPage.replace(Streplace,"")
		    }
		    else
		    {
		            Streplace="|" + ProdFromMenu + "|"
		            StrProdNoReplace=ProdAnsForNextPage.replace(Streplace,"|")
		    }				
			//alert("Streplace=" + Streplace) 
			
            
        //alert("StrProdNoReplace=" + StrProdNoReplace)
			  document.aspnetForm.ProdAnsForNextPage.value=StrProdNoReplace	
			 // alert("Checkanswer=" + document.aspnetForm.ProdAnsForNextPage.value)
			    
			    
			     document.aspnetForm.EnterProduct.disabled=false
	              //next button
	             document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false
	              document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='Button'; 
	            //Back button
	             document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=false
	              document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='Button'; 
	            //Back drop menu
			     document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.disabled=false
			     document.aspnetForm.CFEnd_Q_no.value="";
			return false;  
}



//****************************************** SkipPattern
function SkipPattern(NextQuestion,Question,ProductNo)
{
            
			  // alert("NextQuestion=" + NextQuestion)
		      //alert("Question=" + Question)
			// alert("ProductNo=" + ProductNo)
			
			  Q_no_999=document.aspnetForm.Q_no_999.value;
              Ans_val_999=document.aspnetForm.Ans_val_999.value;
            ///alert("Q_no_999=" + Q_no_999) 
            //alert("Ans_val_999=" + Ans_val_999)
                                 
            Diff_q="";
			NextQuestion=Number(NextQuestion)
			Question=Number(Question)
			 
			if (NextQuestion!="0")
				{ 
					Diff_q=NextQuestion-Question
				}
				 //alert("Diff_q=" + Diff_q);
			 Disable_questions="";
			if (Diff_q==1)
			{
			    Disable_questions="Y";
			}
		     //alert("Disable_questions=" + Disable_questions);
			//alert("ActivityNo=" + ActivityNo)
			//alert("NextQuestion=" + NextQuestion)
			//alert("Question=" + Question)
			//alert("AddQuestion=" + AddQuestion)
	        QuestionList=document.aspnetForm.ControlList.value;
	       // alert("QuestionList=" + QuestionList)
	       // return false;
            PMH_Cnt=0;
            
			if (QuestionList!="")
				{																																																													
						QuestionListArray = QuestionList.split("|");
						arraylength = QuestionListArray.length
						//alert("arraylength=" + arraylength) 
						arraylength=eval(arraylength-1)
						for ( z = 0 ; z < arraylength ; z++ )
							{
							                Q_status="";
											ArrayElement = QuestionListArray[z].valueOf()	
											// alert("ArrayElement=" + ArrayElement)
											 EleColor=ArrayElement.substring(1,ArrayElement.length)
											//alert("EleColor=" + EleColor)
											 
											LoopQuestion=ArrayElement.substring(1,4)
											Ans_Type=ArrayElement.substring(0,1)
											 //alert("Ans_Type=" + Ans_Type)
											Q_no_Counter=LoopQuestion
											// alert("Q_no_Counter=" + Q_no_Counter)
											LoopQuestion=Number(LoopQuestion)
										    if (LoopQuestion==NextQuestion)
										    {
										          Disable_questions="Y";
										    }
											
											if (Question=="1")
												{	
													 Question_One_Check(ArrayElement,NextQuestion)
												}
											
											if (Question < LoopQuestion)
												{
														if (NextQuestion=="0")
															{
																//alert("NextQuestionin=" + NextQuestion)
															   // alert("test1")	
																						if (Ans_Type=="R" || Ans_Type=="L" || Ans_Type=="C")
																								{
																										k=eval("document.aspnetForm." + ArrayElement + ".length")
																										//alert("k55=" + k)	
																										LenCheck=String(k)
																										if (LenCheck=="undefined")
																												{
																																	eval("document.aspnetForm." + ArrayElement + ".checked=false")
																																	eval("document.aspnetForm." + ArrayElement + ".disabled=true")
																																	eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'red'")
																																	StrSpanEle="rad_Span" + EleColor + "0";
                                                                                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")
																												}					
																										else
																												{
																															for (j=0; j<k; j++)
																																{
																																    
																																	eval("document.aspnetForm." + ArrayElement + "[j].checked=false")
																																	eval("document.aspnetForm." + ArrayElement + "[j].disabled=true")
																																	//eval("document.aspnetForm." + ArrayElement + "[j].style.backgroundColor = 'red'")
																																	StrSpanEle="rad_Span" + EleColor + "" + j + "";
																																	eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")			
																																}
																												}
																								}
																							
																							if (Ans_Type=="N" || Ans_Type=="T" || Ans_Type=="P" || Ans_Type=="M" || Ans_Type=="H" || Ans_Type=="D")
																								{
																								        if (Ans_Type=="T")
																											{ 
																												CounterBoxName="Counter" + Q_no_Counter
																												eval("document.aspnetForm." + CounterBoxName + ".value=''")
																												eval("document.aspnetForm." + CounterBoxName + ".style.backgroundColor = 'red'")
																											}
																										 
																										        eval("document.aspnetForm." + ArrayElement + ".value=''")
																										        eval("document.aspnetForm." + ArrayElement + ".disabled=true")
																										        eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'red'")
																										   
																								}
															}
														else
															{
															                if(Ans_Type=="P" || Ans_Type=="M" || Ans_Type=="H")
															                {
															                    PMH_Cnt=PMH_Cnt + 1;
															                }
															                else
															                {
															                    PMH_Cnt=0;
															                }
															                if (PMH_Cnt==2)
															                {
															                    PMH_Cnt=0;
															                }
																			if (LoopQuestion<NextQuestion)
																				{
																				     //alert("if (LoopQuestion<NextQuestion)")
																				    // alert("NextQuestionout=" + NextQuestion)
										                                             //alert("Question=" + Question)
											                                        // alert("LoopQuestion=" + LoopQuestion)
																				    
																				 //alert("test3")
																							if (Ans_Type=="R" || Ans_Type=="L" || Ans_Type=="C")
																								{
																										k=eval("document.aspnetForm." + ArrayElement + ".length")
																										  //alert("ArrayElement1=" + ArrayElement)	
																										LenCheck=String(k)
																										if (LenCheck=="undefined")
																												{
																																	eval("document.aspnetForm." + ArrayElement + ".checked=false")
																																	eval("document.aspnetForm." + ArrayElement + ".disabled=true")
																																	eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'red'")
																																	StrSpanEle="rad_Span" + EleColor + "0";
                                                                                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")
																												}					
																										else
																												{
																															for (j=0; j<k; j++)
																																{
																																	eval("document.aspnetForm." + ArrayElement + "[j].checked=false")
																																	eval("document.aspnetForm." + ArrayElement + "[j].disabled=true")
																																	//eval("document.aspnetForm." + ArrayElement + "[j].style.backgroundColor = 'red'")	
																																	StrSpanEle="rad_Span" + EleColor + "" + j + "";
																																	eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")				
																																}
																												}
																								}
																							if (Ans_Type=="N" || Ans_Type=="T" || Ans_Type=="P" || Ans_Type=="M" || Ans_Type=="H" || Ans_Type=="D")
																								{
																								       if (Ans_Type=="T")
																											{ 
																												CounterBoxName="Counter" + Q_no_Counter
																												eval("document.aspnetForm." + CounterBoxName + ".value=''")
																												eval("document.aspnetForm." + CounterBoxName + ".style.backgroundColor = 'red'")
																											}
																										 
																										        eval("document.aspnetForm." + ArrayElement + ".value=''")
																										        eval("document.aspnetForm." + ArrayElement + ".disabled=true")
																										        eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'red'")
																										    
																								}
																							
																					         if (Number(LoopQuestion)==Number(Q_no_999))
                                                                                                {
												                                                   // alert("Q_statusbegin=" + Q_status)	
												                                                    EndCallForm(NextQuestion,Question) 
												                                                }
																				}
																			//if (LoopQuestion>=NextQuestion)
																			if (LoopQuestion>=NextQuestion)
																				{
																				      // alert("if (LoopQuestion>=NextQuestion)")
																				       // alert("NextQuestionout=" + NextQuestion)
										                                                // alert("Question=" + Question)
											                                           // alert("LoopQuestion=" + LoopQuestion)
																				         
																				       // alert("Q_status=" + Q_status)
																						// alert("Disable_questions=" + Disable_questions)
																						
																						        
																						                if (Ans_Type=="R" || Ans_Type=="L" || Ans_Type=="C")
																								                {
																										                k=eval("document.aspnetForm." + ArrayElement + ".length")
																										                //alert("k3=" + k)	
																										                LenCheck=String(k)
																										                if (LenCheck=="undefined")
																												                {
																												                              Q_status=eval("document.aspnetForm." + ArrayElement + ".disabled")
																													                           // alert("Q_status=" + Q_status)
																													                         if (Q_status==true)
																													                           {
																													                                Disable_questions="" 
																													                           }
                																																           
																												                             if (Disable_questions=="")
													                                                                                            {
																															                            eval("document.aspnetForm." + ArrayElement + ".checked=false")
																															                            eval("document.aspnetForm." + ArrayElement + ".disabled=false")
																															                            eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'white'")
																															                            StrSpanEle="rad_Span" + EleColor + "0";
																															                            //alert("StrSpanEle1=" + StrSpanEle)	
                                                                                                                                                        eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")
                                                                                                                                                }
																												                }
																										                else
																												                {
                																												
                																										
																														                for (j=0; j<k; j++)
																																                {
																																                            Q_status=eval("document.aspnetForm." + ArrayElement + "[j].disabled")
																																                          // alert("Q_status=" + Q_status)
																																                         if (Q_status==true)
																																                           {
																																                              Disable_questions="" 
																																                           }
																																                          if (Disable_questions=="")
													                                                                                                        {
                													 	                                                                                                
																																	                            eval("document.aspnetForm." + ArrayElement + "[j].checked=false")
																																	                            eval("document.aspnetForm." + ArrayElement + "[j].disabled=false")
																																	                            //eval("document.aspnetForm." + ArrayElement + "[j].style.backgroundColor = 'white'")
																																	                            StrSpanEle="rad_Span" + EleColor + "" + j + "";
																																	                            //alert("StrSpanEle2=" + StrSpanEle)	
																																	                            eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'white'")	
																																	                        }				
																																                }
																												                }
																								                }
                																							
																							                if (Ans_Type=="N" || Ans_Type=="T" || Ans_Type=="P" || Ans_Type=="M" || Ans_Type=="H" || Ans_Type=="D")
																								                {
																								                              Q_status=eval("document.aspnetForm." + ArrayElement + ".disabled")
																											                  // alert("Q_statusNTPMH=" + Q_status)	
																											                     if (Q_status==true)
																										                          {
																										                             Disable_questions="" 
																										                          }				   
																											                  if (Disable_questions=="")
													                                                                          {					   
																										                            if (Ans_Type=="T")
																											                            { 
																												                            CounterBoxName="Counter" + Q_no_Counter
																												                            eval("document.aspnetForm." + CounterBoxName + ".value=''")
																												                            eval("document.aspnetForm." + CounterBoxName + ".style.backgroundColor = '#E0E0E0'")
																											                            }
                            																										 
																										                                    eval("document.aspnetForm." + ArrayElement + ".value=''")
																										                                    eval("document.aspnetForm." + ArrayElement + ".disabled=false")
																										                                    eval("document.aspnetForm." + ArrayElement + ".style.backgroundColor = 'white'")
																										                     }
																								                }
																								
																						             
														                                         
														                                           
                                														                
														                                            if (Question==Number(Q_no_999))
                                                                                                        {
                                                                                                            // alert("Q_statusend=" + Q_status)
														                                                    EndCallForm(NextQuestion,Question) 
														                                                }
																							
																				}
																			
																			  
															}//End of next question is zero
														  if (PMH_Cnt==0)
														    {		 
										                        if ((LoopQuestion>=NextQuestion)&&(NextQuestion!=0))
			                                                    {	 
					                                                
			                                                       // alert("Done")
				                                                    return false;	
			                                                    }
			                                                    	
								                            }       
												}//ending of Question < LoopQuestion
											
							}//ending of For loop
				}//Ending of question list is nothing
	EndCallForm(NextQuestion,Question) 	
}

//********************************* End the call form for next question 999

function EndCallForm(NextQuestion,Question)
{
        if (NextQuestion=="999")
        {
                 CFEnd_Q_no=document.aspnetForm.CFEnd_Q_no.value;
                  AnyProduct_answered=document.aspnetForm.AnyProduct_answered.value;
//                 alert("CFEnd_Q_no=" + CFEnd_Q_no)
                //alert("AnyProduct_answered=" + AnyProduct_answered)
                 if (CFEnd_Q_no!=Question)
                    {
                        if (AnyProduct_answered=='Y')                                                       
                            {
                                alert('<%=vPrompts[108]%>')
                            }
                            else
                            {
                                alert('<%=vPrompts[107]%>')
                            }
                    }
                document.aspnetForm.EnterProduct.disabled=true
                //next button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=true
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='ButtonDisabledJava'; 
	            //Back button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=true
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='ButtonDisabledJava'; 
	            //Back drop menu
			    document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.disabled=true	
			    SelectedProduct=document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value;
			   // alert("SelectedProduct=" + SelectedProduct)
			    document.aspnetForm.CFEnd_SelectedProduct.value=SelectedProduct;
			    
			   document.aspnetForm.CallFormEnded.value='Y';
			   document.aspnetForm.CFEnd_Q_no.value= Question;
			   document.aspnetForm.Q_no_999.value=Question;
	    }
	    else
	    {
	            document.aspnetForm.EnterProduct.disabled=false
	              //next button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.disabled=false
	             document.aspnetForm.ctl00$ContentPlaceHolder1$Button2.className='Button'; 
	            //Back button
	            document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.disabled=false
	             document.aspnetForm.ctl00$ContentPlaceHolder1$Button5.className='Button'; 
	            //Back drop menu
			    document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.disabled=false
			    document.aspnetForm.CFEnd_SelectedProduct.value="";
			    document.aspnetForm.CallFormEnded.value="";	
			    document.aspnetForm.CFEnd_Q_no.value="";
	    }
       
}
//********************************* Validation for the next page 
function Validation(ElementName)
{
		//alert("ElementName=" + ElementName)
		
		Product_Type=document.aspnetForm.Product_Type.value
				//alert("Product_Type=" + Product_Type)
				if (Product_Type=="Y")
					{
					
					}
		
			FirstBox=""
			secondBox=""
	if (ElementName!="")
		{ 
				QuestionCheckFlag="0"
				
				
						//alert("ElementName=" + ElementName)
						//ProdQlist=ElementName
						//ProdQNames=eval("document.aspnetForm." + ProdQlist + ".value")
						//alert("ProdQNames=" + ProdQNames)
			            ProdQNames=ElementName
						ArrayAList = ProdQNames.split("|");
						arraylength = ArrayAList.length
						//alert("arraylength=" + arraylength) 
						arraylength=eval(arraylength-1)
		
						for ( i = 0 ; i < arraylength ; i++ )
							{
									EachElementName = ArrayAList[i].valueOf()
									//alert("EachElementName=" + EachElementName)
									Anstype = EachElementName.substring(0,1)
									//alert("Anstype=" + Anstype)
									Q_no=EachElementName.substring(1,4)
									//alert("Q_no=" + Q_no);	
										
									switch(Anstype)
										{
						 				case "C" :		
						 				
						 										Flag=""			
															k=eval("document.aspnetForm." + EachElementName + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
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
																		alert('<%=vPrompts[9]%>' + " " + Q_no)
																		return false;
																}
															
											break
										case "L" :	
															
															Flag=""			
															k=eval("document.aspnetForm." + EachElementName + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
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
																		alert('<%=vPrompts[9]%>' + " " + Q_no)
																		return false;
																}
											break
									    case "R" :
															Flag=""			
															k=eval("document.aspnetForm." + EachElementName + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
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
																		alert('<%=vPrompts[9]%>' + " " + Q_no)
																		return false;
																}
											break
										case "T" :
										
													Q_CheckDisable_T=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_T==false)
														{	
																		textBoxValue_T=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_T=Trim(textBoxValue_T)
																		if (textBoxValue_T!="")
																			{
																					if ((textBoxValue_T.indexOf("'"))>=0)
																						{
																							//alert("The question " + Q_no + " cannot have Single quotes.")
																							alert('<%=vPrompts[57]%>' + " " +  + Q_no + " " + '<%=vPrompts[10]%>')
																							return false;
																						}
																					if ((textBoxValue_T.indexOf(","))>=0)
																						{
																							//alert("The question " + Q_no + " cannot have double quotes.")
																							//alert("The question " + Q_no + " cannot have Comma.")
																							alert('<%=vPrompts[57]%>' + " " +  + " " + Q_no + " " + '<%=vPrompts[13]%>')
																							return false;
																						}		
																			}
																		if (textBoxValue_T=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%>' + " " + Q_no)
																				return false;
																			}
														}//ending of disable		
											break
										case "D" :
										
													Q_CheckDisable_D=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_D==false)
														{	
																		textBoxValue_D=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_D=Trim(textBoxValue_D)
																		if (textBoxValue_D!="")
																			{
																			        if (DatecheckNumber(textBoxValue_D)==false)
																			                {
																			                    //alert("Please enter a valid date for question " + Q_no);
																								alert('<%=vPrompts[14]%>' + " " + Q_no)
																								return false;
																			                }
																					if (isValidDate(textBoxValue_D)==false)
																							{
																								//alert("Please enter a valid date for question " + Q_no);
																								alert('<%=vPrompts[14]%>' + " " + Q_no)
																								return false;
																							}
																					 if (DateHighLowCheck(textBoxValue_D,EachElementName)==false)
																						    {
																							    return false;
																						    }
																			}
																		if (textBoxValue_D=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%>' + " " + Q_no)
																				return false;
																			}
														}//ending of disable		
										
											
											break
										case "N" :
											//alert("N")
													Q_CheckDisable_N=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_N==false)
														{	
																		textBoxValue_N=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_N=Trim(textBoxValue_N)
																		
																		if (textBoxValue_N!="")
																			{
																			         if (checkNumber(textBoxValue_N)==false)
                                                                                        {
                                                                                            //alert("test")
                                                                                            alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[15]%>')
                                                                                            //alert(document.aspnetForm.error_msg[0].value + " " + Question + "," + document.aspnetForm.error_msg[1].value)
                                                                                        
                                                                                            return false;
                                                                                        }   
																					if (NumericVal(EachElementName)	==false)
																						{
																							return false;
																						}
																			}
																		if (textBoxValue_N=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%> ' + " " + Q_no)
																				return false;
																			}
																		
														}//ending of disable	
							
											break
										case "P" :
										
										
													Q_CheckDisable_P=eval("document.aspnetForm." + EachElementName + ".disabled")
														 //alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_P==false)
														{	
																		textBoxValue_P=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_P=Trim(textBoxValue_P)
																		 //alert("textBoxValue_P=" + textBoxValue_P)
																		 //alert("EachElementName=" + EachElementName)	
																		if (textBoxValue_P!="")
																			{
																			         if (checkNumber(textBoxValue_P)==false)
																			                {
																			                    //alert("Please enter a valid date for question " + Q_no);
																									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[15]%> ')
																								return false;
																			                }
																			                
																					    if (PriceVal(EachElementName)==false)
																						    {
																							    return false;
																						    }
																			}
																		if (textBoxValue_P=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%>' + " " + Q_no)
																				return false;
																			}
														}//ending of disable	
					
											break
										case "M" :
													Q_CheckDisable_M=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_M==false)
														{	
																		textBoxValue_M=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_M=Trim(textBoxValue_M)
																		if (textBoxValue_M!="")
																			{
																			         if (checkNumber(textBoxValue_M)==false)
																			                {
																			                    //alert("Please enter a valid date for question " + Q_no);
																									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[15]%> ')
																								return false;
																			                }
																					if (Measurement(EachElementName)==false)
																							{
																								return false;
																							}		
																			}
																		if (textBoxValue_M=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%>' + " " +  Q_no)
																				return false;
																			}
														}//ending of disable	
															
											break
										case "H" :
										
													Q_CheckDisable_H=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_H==false)
														{	
																		textBoxValue_H=eval("document.aspnetForm." + EachElementName + ".value")
																		textBoxValue_H=Trim(textBoxValue_H)
																		if (textBoxValue_H!="")
																			{
																		          if (checkNumber(textBoxValue_H)==false)
																		                {
																		                    //alert("Please enter a valid date for question " + Q_no);
																								alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[15]%> ')
																							return false;
																		                }
																			                
																					if (Time(EachElementName)==false)
																						{
																							return false;
																						}		
																			}
																		if (textBoxValue_H=="")
																			{
																				//alert("Please answer " + Q_no)
																				alert('<%=vPrompts[9]%>' + " " + Q_no)
																				return false;
																			}
														}//ending of disable	
										
															
												
											break
										default:
											InPutValue=""
											//alert("default")
											break
										}
							}	/*Ending of the for loop*/	
					
		
		}//ending of if statement
	return true;		
}
//*********************************************** Save the answers ****************************

function SaveAnswers(GetSavedProd)
{
		  //alert("SaveAnswers")	

		 //alert("GetSavedProd=" + GetSavedProd) 
	//ProdNumForSaveing = GetSavedProd.substring(5,GetSavedProd.length)
	 //alert("ProdNumForSaveing=" + ProdNumForSaveing) 
	 ProdNumForSaveing=document.aspnetForm.Prod_id.value
	 //alert("ProdNumForSaveing=" + ProdNumForSaveing) 
	 //return false;
	//NameOfSave="SavedList" + ProdNumForSaveing
		//alert("NameOfSave=" + NameOfSave)
	//eval("document.aspnetForm." + NameOfSave + ".value=''")  
	  
	 //ProdQNames=eval("document.aspnetForm." + GetSavedProd + ".value")
	 //alert("ProdQNames=" + ProdQNames) 
	 
	FirstTime="YES"
	ProdListArray = GetSavedProd.split("|");
	arraylength = ProdListArray.length
	//alert("arraylength=" + arraylength) 
	arraylength=eval(arraylength-1)
	
		for ( i = 0 ; i < arraylength ; i++ )
			{
				ProdQNum = ProdListArray[i].valueOf()
				//alert("ProdQNum=" + ProdQNum)
				Ans_Type = ProdQNum.substring(0,1)
				//alert("Ans_Type=" + Ans_Type)
				QuestionCondition=false
									if (Ans_Type=="R" || Ans_Type=="L" || Ans_Type=="C") 
											{
														k=eval("document.aspnetForm." + ProdQNum + ".length")
															//alert("k=" + k)
														//alert("kkkkkk=" + k)	
														LenCheck=String(k)
														if (LenCheck=="undefined")
															{
																QuestionCondition=eval("document.aspnetForm." + ProdQNum + ".disabled")
																//alert("QuestionCondition1=" + QuestionCondition)
															}
														else
															{
																	for (j=0; j<k; j++)
																			{	
																				QuestionCondition=eval("document.aspnetForm." + ProdQNum + "[j].disabled")
																				//eval("document.Activity_Form." + ElementName + "[j].checked=false")
																				if (QuestionCondition==true)
																					{
																						//alert("QuestionCondition2=" + QuestionCondition)
																						break;
																					} 			
																			}
															}
											}
										else
											{
												
												QuestionCondition=eval("document.aspnetForm." + ProdQNum + ".disabled")
											}
										//alert("QuestionCondition3=" + QuestionCondition)
				
					ValueOfElement=""
					switch(Ans_Type)
							{
			 				case "C" :
											ValueOfElement=""
											k=eval("document.aspnetForm." + ProdQNum + ".length")
											//alert("k2=" + k)	
											LenCheck=String(k)
											if (LenCheck=="undefined")
												{
													CheckOfElement=eval("document.aspnetForm." + ProdQNum + ".checked")
														//alert("CheckOfElement=" + CheckOfElement)	
													if (CheckOfElement==true)
														{
															ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
															//alert("ValueOfElement=" + ValueOfElement)	
														}	
												}
											else
												{
													ValueOfElement=""						
													for (j=0; j<k; j++)
														{
															//alert("j=" + j)
															RadioValue=eval("document.aspnetForm." + ProdQNum + "[j].checked")
															//alert("RadioValue=" + RadioValue)

															if (RadioValue==true)
																{
																	InPutValue=eval("document.aspnetForm." + ProdQNum + "[j].value")
																}
															else
															    {
																	InPutValue=""
															    }
															    
																						//alert("InPutValueCheck=" + InPutValue)
																						if ((InPutValue!=""))
																							{
																										
																													ProdWithAnswer="" + ProdQNum + "," + InPutValue + ""
																													//alert("ProdWithAnswer=" + ProdWithAnswer)
							
																													if (FirstTime=="YES")
																														{
																															FinalProdWithAnswer="" + ProdWithAnswer + ""
																															FirstTime=""	
																														}
																													else
																														{
																															NameOfSave="SavedList" + ProdNumForSaveing
																															//alert("NameOfSave=" + NameOfSave)
																															
																															ProdWithAnswerBack =eval("document.aspnetForm." + NameOfSave + ".value")
																															FinalProdWithAnswer="" + ProdWithAnswerBack + "|" + ProdWithAnswer + ""
																														}
																												//alert("FinalProdWithAnswer=" + FinalProdWithAnswer)
							
																												//alert("AnsInputid=" + AnsInputid)
																												NameOfSave="SavedList" + ProdNumForSaveing
																													//alert("NameOfSave=" + NameOfSave)
																												eval("document.aspnetForm." + NameOfSave + ".value='" + FinalProdWithAnswer + "'")
										
																												AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
																												//alert("AnswerSaveForProd=" + AnswerSaveForProd)
																							
																							}//ending (InPutValue!="")||(QuestionCondition==true)
																
														}//Ending of for loop
												}
														
												
			 						//ValueOfElement=""
								break
							case "L" :					
											ValueOfElement=""
											k=eval("document.aspnetForm." + ProdQNum + ".length")
											//alert("k3=" + k)	
											LenCheck=String(k)
											if (LenCheck=="undefined")
												{
														
																	RadioValue=eval("document.aspnetForm." + ProdQNum + ".checked")
																	//alert("RadioValue=" + RadioValue)
																	if (RadioValue==true)
																		{
																			ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
																		}
												}
											else
												{
														for (j=0; j<k; j++)
															{
																	//alert("j=" + j)
																	RadioValue=eval("document.aspnetForm." + ProdQNum + "[j].checked")
																	//alert("RadioValue=" + RadioValue)
																	if (RadioValue==true)
																		{
																			ValueOfElement=eval("document.aspnetForm." + ProdQNum + "[j].value")
																		}
															}
														//alert("ValueOfElement=" + ValueOfElement)	
												}
								break
						    case "R" :
								
											ValueOfElement=""
											k=eval("document.aspnetForm." + ProdQNum + ".length")
											//alert("k4=" + k)	
											LenCheck=String(k)
											if (LenCheck=="undefined")
												{
														
																	RadioValue=eval("document.aspnetForm." + ProdQNum + ".checked")
																	//alert("RadioValue=" + RadioValue)
																	if (RadioValue==true)
																		{
																			ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
																		}
												}
											else
												{
														for (j=0; j<k; j++)
															{
																	//alert("j=" + j)
																	RadioValue=eval("document.aspnetForm." + ProdQNum + "[j].checked")
																	//alert("RadioValue=" + RadioValue)
																	if (RadioValue==true)
																		{
																			ValueOfElement=eval("document.aspnetForm." + ProdQNum + "[j].value")
																		}
															}
														//alert("ValueOfElement=" + ValueOfElement)	
												}
								break
							case "T" :
								//alert("answerBackT")
								//alert("ANS_Value=" + ANS_Value)
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//alert("ValueOfElement=" + ValueOfElement)
								break
							case "D" :
								//alert("D")
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//ValueOfElement="D" + ValueOfElement
									//alert("ValueOfElement=" + ValueOfElement)
										
								break
							case "N" :
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//alert("ValueOfElement=" + ValueOfElement)
									//alert("ProdQNum=" + ProdQNum)
									 //ValueOfElement="D" + ValueOfElement
									
								break
							case "P" :
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//alert("ValueOfElement=" + ValueOfElement)
								//alert("N")
								break
							case "M" :
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//alert("ValueOfElement=" + ValueOfElement)
								//alert("N")
								break
							case "H" :
									ValueOfElement=eval("document.aspnetForm." + ProdQNum + ".value")
									//alert("ValueOfElement=" + ValueOfElement)
								//alert("N")
								break
							default:
								ValueOfElement=""
								//alert("default")
								break
							}
							ValueOfElement=Trim(ValueOfElement)
							//alert("ValueOfElement=" + ValueOfElement.length)
							if ((ValueOfElement!="")||(QuestionCondition==true))
								{
										if (QuestionCondition==true)
												{
													ValueOfElement="Disabled"
												}
												
										ProdWithAnswer="" + ProdQNum + "," + ValueOfElement + ""
										//alert("ProdWithAnswer=" + ProdWithAnswer)
							
											if (FirstTime=="YES")
												{
													FinalProdWithAnswer="" + ProdWithAnswer + ""
													FirstTime=""	
												}
											else
												{
													NameOfSave="SavedList" + ProdNumForSaveing
													//alert("NameOfSave=" + NameOfSave)
													
													ProdWithAnswerBack =eval("document.aspnetForm." + NameOfSave + ".value")
													FinalProdWithAnswer="" + ProdWithAnswerBack + "|" + ProdWithAnswer + ""
												}
										// alert("FinalProdWithAnswer=" + FinalProdWithAnswer)
							
										 //alert("ProdNumForSaveing=" + ProdNumForSaveing)
										NameOfSave="SavedList" + ProdNumForSaveing
											//alert("NameOfSave=" + NameOfSave)
										eval("document.aspnetForm." + NameOfSave + ".value='" + FinalProdWithAnswer + "'")
										
										AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
										  //alert("AnswerSaveForProd=" + AnswerSaveForProd)
										
										 
										
							 }
			}
		
		//Put color in the dropdown menu
	 
		 AnsweredProduct(ProdNumForSaveing)
		GetColor(ProdNumForSaveing)
}
//Save the products for next page that are answered in a list so it can use for the loop before going to next page.
function AnsweredProduct(ProdNo)
{
    //alert("ProdNo=" + ProdNo) 
    
    NameOfSave="SavedList" + ProdNo
	AnswerSaveCheck =eval("document.aspnetForm." + NameOfSave + ".value")
    //alert("AnswerSaveCheck=" + AnswerSaveCheck) 
    
     ProdAnsForNextPage=eval("document.aspnetForm.ProdAnsForNextPage.value")
     // alert("ProdAnsForNextPage=" + ProdAnsForNextPage) 
     
     if (AnswerSaveCheck!="")
     {
                 if (ProdAnsForNextPage=="")
                 {
                        //alert("Empty")
                        document.aspnetForm.ProdAnsForNextPage.value=ProdNo + "|" 
	             }
	             else
	             {
			            ProdAnsFNPArray = ProdAnsForNextPage.split("|");
	                    PAlength = ProdAnsFNPArray.length
	                    //alert("arraylength=" + arraylength)  Trim
	                    PAlength=eval(PAlength-1)
	                    AddProd="Y";
	                    for (s = 0 ; s < PAlength ; s++ )
			            {
			                PAFNPAEle = ProdAnsFNPArray[s].valueOf()
			                //alert("PAFNPAEle=" + PAFNPAEle)
			                //alert("ProdNo=" + ProdNo) 
			                 if (Trim(ProdNo)==(PAFNPAEle))
			                {   
			                  // alert("break") 
			                   AddProd="N";
			                } 
			            }
			           // alert("AddProd=" + AddProd) 
			          
			           
                        if (Trim(AddProd)=="Y")
			              {
			                 document.aspnetForm.ProdAnsForNextPage.value=ProdAnsForNextPage + "" + ProdNo + "|"    
			              }  
                 }//if (ProdAnsForNextPage=="")
     }// if (AnswerSaveCheck!="")
     ProdAnsForNextPage=eval("document.aspnetForm.ProdAnsForNextPage.value")
      //alert("ProdAnsForNextPage=" + ProdAnsForNextPage) 
} 

function GetColor(ProdNumForSaveing)
{
            //alert("ProdNumForSaveing=" + ProdNumForSaveing)
			NameOfSave="SavedList" + ProdNumForSaveing
			AnswerSaveForProd =eval("document.aspnetForm." + NameOfSave + ".value")
			colorvalue=document.aspnetForm.Menu_id.value;
			
			 colorvalue=Number(colorvalue) + 1 
			  //alert("colorvalue=" + colorvalue)
			 NameOfColor="ProductColor" + ProdNumForSaveing
			 //alert("NameOfSave=" + NameOfSave)
			 eval("document.aspnetForm." + NameOfColor + ".value=" + colorvalue + "") 
			 
			if (AnswerSaveForProd!="")
				{			
					document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[colorvalue].style.backgroundColor = 'Deepskyblue'
					 eval("document.aspnetForm." + NameOfColor + ".value=" + colorvalue + "") 
				}
			if (AnswerSaveForProd=="")
				{		
				     
				     //alert("colorremove=" + colorvalue)	
					 document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[colorvalue].style.backgroundColor = 'white'
					 eval("document.aspnetForm." + NameOfColor + ".value=''") 
					  Get_Mandatory_Product_color()
				}
}

// ************************************* Display the answers text back if it's been answered
function Display_Q_Ans_Span_Txt(QListValue)
{

	        //NameOfAnsTxt="Show_Res_Text" + QListValue	
			NameOfAnsTxt="AnsDisplayList" + QListValue	
		
		    hh_res_txt=eval("document.aspnetForm." + NameOfAnsTxt + ".value")
		   // alert("hh_res_txt=" + hh_res_txt)
		    if (hh_res_txt!="")
		    {
		        ArrayAllRes_txt=hh_res_txt.split("|");
    		 
		        Arr_Res_len = ArrayAllRes_txt.length
		        //alert("arraylength=" + arraylength) 
		        //arraylength=eval(arraylength-1)
    		
			    for (h = 0 ; h < Arr_Res_len ; h++ )
				    {
						    Res_EachElement = ArrayAllRes_txt[h].valueOf()
						    //alert("Res_EachElement=" + Res_EachElement)	
    						
                            ArrayRes_txt=Res_EachElement.split("_");
                            Span_res_id = ArrayRes_txt[0].valueOf()
                            Span_res_Ans = ArrayRes_txt[1].valueOf()
                            //alert("Span_res_id=" + Span_res_id)
                           // alert("Span_res_Ans=" + Span_res_Ans)	
                            
                            NameOfAnsSpan="Show_Res_Text" + Span_res_id		
                           // alert("NameOfAnsSpan=" + NameOfAnsSpan)
                            		  
                                var IdExists= eval("document.getElementById('" + NameOfAnsSpan + "')")
                            //		  //alert("IdExists=" + IdExists);
                             if (IdExists!=null)
                                {              
                                        eval("document.getElementById('" + NameOfAnsSpan + "').innerHTML='" + Span_res_Ans + "'")
                                }

			         }//for loop
		    }//if (hh_res_txt!="")
		    
}



// ************************************* Display the answers back if it's been answered
function DisplayAnswers(QListValue)
{
		 //alert("DisplayAnswers")
		NameOfSave="SavedList" + QListValue		
		// alert("NameOfSave=" + NameOfSave)
		
		HiddenProdNum=eval("document.aspnetForm." + NameOfSave + ".value")
		// alert("HiddenProdNum=" + HiddenProdNum)
		if (HiddenProdNum!="")
			{
				//alert("What=" + eval("document.aspnetForm." + NameOfSave + ".value"))
				HiddenProdList=eval("document.aspnetForm." + NameOfSave + ".value")
			}
		else
			{
				//alert("Not tHere")
				return false;
			}
		
		//Display answer text for each response
         Display_Q_Ans_Span_Txt(QListValue)

		ArrayAList = HiddenProdList.split("|");
		arraylength = ArrayAList.length
		//alert("arraylength=" + arraylength) 
		//arraylength=eval(arraylength-1)
		
			for ( i = 0 ; i < arraylength ; i++ )
				{
						EachElement = ArrayAList[i].valueOf()
						// alert("EachElement=" + EachElement)
						Anstype = EachElement.substring(0,1)
						//alert("Anstype=" + Anstype)
						
						POS=EachElement.indexOf(",")
						//alert("POS=" + POS);
						ElementName=EachElement.substring(0,POS)
						//alert("ElementName22=" + ElementName);
						 EleColor=ElementName.substring(1,ElementName.length)
                       //alert("EleColor=" + EleColor)
                       Q_no_Counter=ElementName.substring(1,4)
						// alert("Q_no_Counter=" + Q_no_Counter);	
						//alert("Test1")
						LastPOS = EachElement.length
						//alert("LastPOS=" + LastPOS);
						POS2=eval(POS+1)
						ANS_Value=EachElement.substring(POS2,LastPOS)
						//alert("ANS_Value=" + ANS_Value);
						//alert("Test2")
						//return false;
						switch(Anstype)
							{
			 				case "C" :					
										
											k=eval("document.aspnetForm." + ElementName + ".length")
											//alert("k=" + k)	
											LenCheck=String(k)
											if (LenCheck=="undefined")
												{
																if (ANS_Value=="Disabled")
																	{
																		eval("document.aspnetForm." + ElementName + ".disabled=true")
																		//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
																		StrSpanEle="rad_Span" + EleColor + "0";
                                                                        eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																		 
																	}
																else
																	{
																				CheckValue=eval("document.aspnetForm." + ElementName + ".value")
																				//alert("RadioValue=" + RadioValue)
																				if (CheckValue==ANS_Value)
																					{
																						eval("document.aspnetForm." + ElementName + ".checked=true")
																						//alert("set=" + InPutValue);	
																					}
																	}
												}
											else
												{
												
														for (j=0; j<k; j++)
															{
																			if (ANS_Value=="Disabled")
																				{
																					eval("document.aspnetForm." + ElementName + "[j].disabled=true")
																					//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'red'")
																				    StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																				}
																			else
																				{
																							//alert("j=" + j)
																							RadioValue=eval("document.aspnetForm." + ElementName + "[j].value")
																							//alert("RadioValue=" + RadioValue)
																							if (RadioValue==ANS_Value)
																								{
																									//InPutValue=eval("document.aspnetForm." + Q_Value + "[j].value")
																									eval("document.aspnetForm." + ElementName + "[j].checked=true")
																									//alert("set=" + InPutValue);	
																								}
																				}
															}
												}		
								break
							case "L" :			
										k=eval("document.aspnetForm." + ElementName + ".length")
										//alert("k=" + k)	
										LenCheck=String(k)
											if (LenCheck=="undefined")
												{
																if (ANS_Value=="Disabled")
																	{
																		eval("document.aspnetForm." + ElementName + ".disabled=true")
																		//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
																	    StrSpanEle="rad_Span" + EleColor + "0";
                                                                        eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																	}
																else
																	{
																			CheckValue=eval("document.aspnetForm." + ElementName + ".value")
																			//alert("RadioValue=" + RadioValue)
																			if (CheckValue==ANS_Value)
																				{
																					eval("document.aspnetForm." + ElementName + ".checked=true")
																					//alert("set=" + InPutValue);	
																				}
																	}
												}
											else
												{
														
													for (j=0; j<k; j++)
															{
																		if (ANS_Value=="Disabled")
																				{
																					 eval("document.aspnetForm." + ElementName + "[j].disabled=true")
																					//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'red'")
																					 StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                                     eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																				}
																			else
																				{
																							//alert("j=" + j)
																							RadioValue=eval("document.aspnetForm." + ElementName + "[j].value")
																							//alert("RadioValue=" + RadioValue)
																							if (RadioValue==ANS_Value)
																								{
																									//InPutValue=eval("document.aspnetForm." + Q_Value + "[j].value")
																									eval("document.aspnetForm." + ElementName + "[j].checked=true")
																									//alert("set=" + InPutValue);	
																								}
																				}
															}
												}
								break
						    case "R" :
										k=eval("document.aspnetForm." + ElementName + ".length")
										//alert("k=" + k)	
										
											LenCheck=String(k)
											if (LenCheck=="undefined")
												{
																if (ANS_Value=="Disabled")
																	{
																		eval("document.aspnetForm." + ElementName + ".disabled=true")
																		//eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
																		StrSpanEle="rad_Span" + EleColor + "0";
                                                                        eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																	}
																else
																	{
																				CheckValue=eval("document.aspnetForm." + ElementName + ".value")
																				//alert("RadioValue=" + RadioValue)
																				if (CheckValue==ANS_Value)
																					{
																						eval("document.aspnetForm." + ElementName + ".checked=true")
																						//alert("set=" + InPutValue);	
																					}
																	}
												}
											else
												{
													for (j=0; j<k; j++)
															{
																		if (ANS_Value=="Disabled")
																				{
																					eval("document.aspnetForm." + ElementName + "[j].disabled=true")
																					//eval("document.aspnetForm." + ElementName + "[j].style.backgroundColor = 'red'")
																					StrSpanEle="rad_Span" + EleColor + "" + j + "";
                                                                                    eval("document.getElementById('" + StrSpanEle + "').style.backgroundColor= 'red'")	
																				}
																			else
																				{
																						//alert("j=" + j)
																						RadioValue=eval("document.aspnetForm." + ElementName + "[j].value")
																						//alert("RadioValue=" + RadioValue)
																						if (RadioValue==ANS_Value)
																							{
																								//InPutValue=eval("document.aspnetForm." + Q_Value + "[j].value")
																								eval("document.aspnetForm." + ElementName + "[j].checked=true")
																								//alert("set=" + InPutValue);	
																							}
																				}
															}
												}
								break
							case "T" :
								//alert("answerBackT")
								//alert("ANS_Value=" + ANS_Value)
												if (ANS_Value=="Disabled")
														{
															eval("document.aspnetForm." + ElementName + ".disabled=true")
															eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
														    CounterBoxName="Counter" + Q_no_Counter
															eval("document.aspnetForm." + CounterBoxName + ".value=''")
															eval("document.aspnetForm." + CounterBoxName + ".style.backgroundColor = 'red'")
																											 
														}
													else
														{
															eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
														}
								break
							case "D" :
								//alert("D")
									if (ANS_Value=="Disabled")
											{
												eval("document.aspnetForm." + ElementName + ".disabled=true")
												eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
											}
										else
											{
												eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
											}
								break
							case "N" :
								//alert("N")
									if (ANS_Value=="Disabled")
											{
												eval("document.aspnetForm." + ElementName + ".disabled=true")
												eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
											}
										else
											{
												eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
											}
								break
							case "P" :
								//alert("N")
									if (ANS_Value=="Disabled")
											{
												eval("document.aspnetForm." + ElementName + ".disabled=true")
												eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
											}
										else
											{
												eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
											}
								break
							case "M" :
								//alert("N")
									if (ANS_Value=="Disabled")
											{
												eval("document.aspnetForm." + ElementName + ".disabled=true")
												eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
											}
										else
											{
												eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
											}
								break
							case "H" :
								//alert("N")
									if (ANS_Value=="Disabled")
											{
												eval("document.aspnetForm." + ElementName + ".disabled=true")
												eval("document.aspnetForm." + ElementName + ".style.backgroundColor = 'red'")
											}
										else
											{
												eval("document.aspnetForm." + ElementName + ".value='" + ANS_Value + "'")
											}
								break
							default:
								InPutValue=""
								//alert("default")
								break
							}
				}	
}


//*********************************************** if any questions been answers then make sure that all the questions are answered for a product. 
function AnyQuestionAnswered(ElementName)
{
		// alert("AnyQuestionAnswered=" + ElementName)
		
		//Product_Type=document.aspnetForm.Product_Type.value
				//alert("Product_Type=" + Product_Type)
				//if (Product_Type=="Y")
					//{
					
				    //}
		
			FirstBox=""
			secondBox=""
	if (ElementName!="")
		{ 
				QuestionCheckFlag="0"
				
				
						//alert("ElementName=" + ElementName)
						//ProdQlist=ElementName
						//ProdQNames=eval("document.aspnetForm." + ProdQlist + ".value")
						//alert("ProdQNames=" + ProdQNames)
			            ProdQNames=ElementName;
						ArrayAList = ProdQNames.split("|");
						arraylength = ArrayAList.length
						//alert("arraylength=" + arraylength) 
						arraylength=eval(arraylength-1)
						Flag=""	
						for ( i = 0 ; i < arraylength ; i++ )
							{
									EachElementName = ArrayAList[i].valueOf()
									// alert("EachElementName=" + EachElementName)
									Anstype = EachElementName.substring(0,1)
									//alert("Anstype=" + Anstype)
									Q_no=EachElementName.substring(1,4)
									//alert("Q_no=" + Q_no);	
										
									switch(Anstype)
										{
						 				case "C" :		
						 				
						 												
															k=eval("document.aspnetForm." + EachElementName + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																					 document.aspnetForm.AnyProduct_answered.value='';
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																															 document.aspnetForm.AnyProduct_answered.value='';
																														}
																											}
																										else
																											{
																													Flag="0"
																													
																											}		
			
																							}
																						else
																						    {
																						        Flag="0"
																						    }		
																				}
																		
																}
															if (Flag=="0")
																{
																     document.aspnetForm.AnyProduct_answered.value='Y';
																	return false;
																}	
															
											break
										case "L" :	
															
															Flag=""			
															k=eval("document.aspnetForm." + EachElementName + ".length")
															// alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																	 //alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																					 document.aspnetForm.AnyProduct_answered.value='';
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																															 document.aspnetForm.AnyProduct_answered.value='';
																														}
																											}
																										else
																											{
																													Flag="0"
																											}		
			
																							}
																							else
																						    {
																						        Flag="0"
																						    }			
																				}
																		
																}
															if (Flag=="0")
																{
																    document.aspnetForm.AnyProduct_answered.value='Y';
																	return false;
																}	
											break
									    case "R" :
															Flag=""			
															k=eval("document.aspnetForm." + EachElementName + ".length")
															//alert("kV=" + k)	
															LenCheck=String(k)
															if (LenCheck=="undefined")
																{
																	Q_CheckDisable=eval("document.aspnetForm." + EachElementName + ".disabled")
																		//alert("Q_CheckDisable=" + Q_CheckDisable)	
																	if (Q_CheckDisable==false)
																		{
																				QuestionCheck=eval("document.aspnetForm." + EachElementName + ".checked")
																				if (QuestionCheck==false)
																				{
																					Flag="1"
																					 document.aspnetForm.AnyProduct_answered.value='';
																				}		
																		}	
																}
															else
																{		
																			
																		for (j=0; j<k; j++)
																				{	
																				
																						Q_CheckDisable=eval("document.aspnetForm." + EachElementName + "[j].disabled")
																							//alert("Q_CheckDisable=" + Q_CheckDisable)	
																						if (Q_CheckDisable==false)
																							{
																										QuestionCheck=eval("document.aspnetForm." + EachElementName + "[j].checked")
																										if (QuestionCheck==false)
																											{
																													if (Flag!="0")
																														{
																															Flag="1"
																															 document.aspnetForm.AnyProduct_answered.value='';
																														}
																											}
																										else
																											{
																													Flag="0"
																											}		
			
																							}
																							else
																						    {
																						        Flag="0"
																						    }			
																				}
																		
																}
															if (Flag=="0")
																{
																    document.aspnetForm.AnyProduct_answered.value='Y';
																	return false;
																}
											break
										case "T" :
													Flag=""	
													Q_CheckDisable_T=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_T==false)
														{	
																		textBoxValue_T=eval("document.aspnetForm." + EachElementName + ".value")
																		if (textBoxValue_T!="")
																			{
																					if ((textBoxValue_T.indexOf("'"))>=0)
																						{
																							//alert("The question " + Q_no + " cannot have Single quotes.")
																							//alert("" + document.aspnetForm.error_msg[57].value + " " + Q_no + " " + document.aspnetForm.error_msg[12].value + "")
																							alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[12]%> ')
																							return false;
																						}
																					if ((textBoxValue_T.indexOf(","))>=0)
																						{
																							//alert("The question " + Q_no + " cannot have double quotes.")
																							//alert("The question " + Q_no + " cannot have Comma.")
																							//alert("" + document.aspnetForm.error_msg[57].value + " " + Q_no + " " + document.aspnetForm.error_msg[13].value + "")
																							alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[13]%> ')	
																							return false;
																						}		
																			}
																		if (textBoxValue_T=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_T!="")
																			{
																				Flag="0"
																			}	
														}//ending of disable
														else
													    {
													        Flag="0"
													    }	
														if (Flag=="0")
															{
															     document.aspnetForm.AnyProduct_answered.value='Y';
																return false;
															}		
											break
										case "D" :
													Flag=""	
													Q_CheckDisable_D=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_D==false)
														{	
																		textBoxValue_D=eval("document.aspnetForm." + EachElementName + ".value")
																		if (textBoxValue_D!="")
																			{
																					//if (isValidDate(textBoxValue_D)==false)
																					//		{
																								//alert("Please enter a valid date for question " + Q_no);
																								//alert("" + document.aspnetForm.error_msg[14].value + " " + Q_no + "")
																								return false;
																					//		}
																			}
																		if (textBoxValue_D=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_D!="")
																			{
																				Flag="0"
																			}
														}//ending of disable		
											            else
													    {
													        Flag="0"
													    }
														if (Flag=="0")
															{
															     document.aspnetForm.AnyProduct_answered.value='Y';
																return false;
															}	
											break
										case "N" :
											//alert("N")
													Flag=""	
													Q_CheckDisable_N=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_N==false)
														{	
																		textBoxValue_N=eval("document.aspnetForm." + EachElementName + ".value")
																		//if (textBoxValue_N!="")
																		//	{
																		//			if (NumericVal(EachElementName)	==false)
																		//				{
																		//					return false;
																		//				}
																		//	}
																		if (textBoxValue_N=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_N!="")
																			{
																				Flag="0"
																			}
														}//ending of disable	
													 else
													    {
													        Flag="0"
													    }
													if (Flag=="0")
															{
															    document.aspnetForm.AnyProduct_answered.value='Y';
																return false;
															}	
											break
										case "P" :
										
													Flag=""	
													Q_CheckDisable_P=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_P==false)
														{	
																		textBoxValue_P=eval("document.aspnetForm." + EachElementName + ".value")
																		if (textBoxValue_P!="")
																			{
																					if (PriceVal(EachElementName)==false)
																						{
																							return false;
																						}
																			}
																		if (textBoxValue_P=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_P!="")
																			{
																				Flag="0"
																			}
														}//ending of disable
													 else
													    {
													        Flag="0"
													    }	
													if (Flag=="0")
														{
														     document.aspnetForm.AnyProduct_answered.value='Y';
															return false;
														}	
											break
										case "M" :
													Flag=""	
													Q_CheckDisable_M=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_M==false)
														{	
																		textBoxValue_M=eval("document.aspnetForm." + EachElementName + ".value")
																		if (textBoxValue_M!="")
																			{
																					if (Measurement(EachElementName)==false)
																							{
																								return false;
																							}		
																			}
																		if (textBoxValue_M=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_M!="")
																			{
																				Flag="0"
																			}
														}//ending of disable
													 else
													    {
													        Flag="0"
													    }	
													if (Flag=="0")
														{
														    document.aspnetForm.AnyProduct_answered.value='Y';
															return false;
														}				
											break
										case "H" :
													Flag=""	
													Q_CheckDisable_H=eval("document.aspnetForm." + EachElementName + ".disabled")
														//alert("Q_CheckDisable=" + Q_CheckDisable)	
													if (Q_CheckDisable_H==false)
														{	
																		textBoxValue_H=eval("document.aspnetForm." + EachElementName + ".value")
																		if (textBoxValue_H!="")
																			{
																					if (Time(EachElementName)==false)
																						{
																							return false;
																						}		
																			}
																		if (textBoxValue_H=="")
																			{
																			     document.aspnetForm.AnyProduct_answered.value='';
																				Flag="1"
																			}
																		if (textBoxValue_H!="")
																			{
																				Flag="0"
																			}	
														}//ending of disable	
											        else
													    {
													        Flag="0"
													    }
													if (Flag=="0")
														{
														     document.aspnetForm.AnyProduct_answered.value='Y';
															return false;
														}			
												
											break
										default:
											InPutValue=""
											//alert("default")
											break
										}
							}	/*Ending of the for loop*/	
					
		
		}//ending of if statement
	return true;		
}
//********************************** save the answer for the next page

function SaveProductNextPage()
{

	  DisableButtons()
	  Answer_Check=document.aspnetForm.Save_One_Answer.value
	  StrCallFormEnded=document.aspnetForm.CallFormEnded.value;	
	//alert("Answer_Check=" + Answer_Check)
   // alert("StrCallFormEnded=" + StrCallFormEnded)
	
	 if ( document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value == '999999' )
        {
            //alert("Please select Product from the menu or enter a product number.")
             alert('<%=vPrompts[3]%>')
             AbleButtons()
             return false;
        }
	
	        NumberOfitem=0
			//document.aspnetForm.SelectedProduct.options[document.aspnetForm.SelectedProduct.selectedIndex].style.backgroundColor = 'Deepskyblue'
			//OptionOfMenu=document.aspnetForm.SelectedProduct.selectedIndex;
			//alert("OptionOfMenu=" + OptionOfMenu)
			GetSavedProd=document.aspnetForm.ControlList.value
			 Prod_id=document.aspnetForm.Prod_id.value
			 // alert("GetSavedProdNext=" + GetSavedProd)
			  // alert("Prod_id=" + Prod_id)
			/* With function you can save the value for the page before*/
	
			if (GetSavedProd!="")
				{
					//This function check if any questions answered then you have to answer each question.	
						if (AnyQuestionAnswered(GetSavedProd)==false)
							{
								if (Validation(GetSavedProd)==false)
									{
									    AbleButtons()
										return false;
									}
							}
					SaveAnswers(GetSavedProd)	
				}
			AnyProduct_answered = document.aspnetForm.AnyProduct_answered.value ;
			//alert("AnyProduct_answered=" + AnyProduct_answered)
			Product_Type=document.aspnetForm.Product_Type.value
			//alert("Product_Type=" + Product_Type)
			// alert("Product_Type=" + Product_Type)
					
			ProdAnsForNextPage=eval("document.aspnetForm.ProdAnsForNextPage.value")
            //alert("ProdAnsForNextPage=" + ProdAnsForNextPage) 	
				
			eval("document.aspnetForm.InputidsAnswersAll.value=''")
			eval("document.aspnetForm.AnswersForMenuColor.value=''")	
			AllProdNames=document.aspnetForm.AllProdNames.value;	
			 //alert("AllProdNames=" + AllProdNames) 
			 if (StrCallFormEnded=="Y")
		      {
		            AllProdNames="" + Trim(Prod_id) + "|"
					ProdAnsForNextPage="" + Trim(Prod_id) + "|"
		      }
			if (Answer_Check=="Y")
				{
					AllProdNames="1|"
					ProdAnsForNextPage="1|"
				}
			 // alert("AllProdNames=" + AllProdNames)
			//alert("ProdAnsForNextPage=" + ProdAnsForNextPage) 	
			if (Product_Type=="Y")
			{
			     ArrayAList = AllProdNames.split("|");      
			}
			else
			{
			    ArrayAList = ProdAnsForNextPage.split("|");   
			}
			
			arraylength = ArrayAList.length
			 //alert("arraylength=" + arraylength) 
			arraylength=eval(arraylength-1)
			p=0
			for ( i = 0 ; i < arraylength ; i++ )
				{
								ElementName = ArrayAList[i].valueOf()
								//alert("i=" + i)
								//alert("ElementName=" + ElementName)
						//For each product
								ProdDoneList="SavedList" + ElementName	
								ProdDoneAnswer=eval("document.aspnetForm." + ProdDoneList + ".value")
								//alert("ProdDoneList=" + ProdDoneList)
								 // alert("ProdDoneAnswer=" + ProdDoneAnswer)
						//For each color in the menu
								NameOfColor="ProductColor" + ElementName
									//alert("NameOfSave=" + NameOfSave)
								colorvalue=eval("document.aspnetForm." + NameOfColor + ".value")
                                //alert("colorvalue=" + colorvalue)
							if (ProdDoneAnswer!="")
								{
										//alert("ProdDoneAnswer=" + ProdDoneAnswer)
										
											InputidsAnswersHasValue =eval("document.aspnetForm.InputidsAnswersAll.value")
											AnswersHasColorValue =eval("document.aspnetForm.AnswersForMenuColor.value")
											//alert("AnswersHasColorValue=" + AnswersHasColorValue)
										
											if (InputidsAnswersHasValue=="")
												{
														InputidsAddAll="" + ProdDoneAnswer + ""
														MenuColorString="" + ElementName + "," + colorvalue + "" 
														//alert("MenuColorString=" + MenuColorString)	
														MenuColorAnswers=MenuColorString
												}
											else
												{
														InputidsAddAll="" + InputidsAnswersHasValue + "|" + ProdDoneAnswer + ""
														MenuColorString="" + ElementName + "," + colorvalue + "" 
														MenuColorAnswers="" + AnswersHasColorValue + "|" + MenuColorString + ""
												}
										// alert("MenuColorString=" + MenuColorString)	
									InputidsAnswersAll =eval("document.aspnetForm.InputidsAnswersAll.value='" + InputidsAddAll + "'")
									 //alert("InputidsAnswerstest=" + InputidsAnswersAll)
									MenuColorAnswersprint=eval("document.aspnetForm.AnswersForMenuColor.value='" + MenuColorAnswers + "'")
									 //alert("MenuColorAnswersprint=" + MenuColorAnswersprint)
									NumberOfitem=NumberOfitem + 1
								}
 
				}
			
				//alert("NumberOfitem=" + NumberOfitem)
				 if (NumberOfitem==0)
                    {
	                    //alert("Minimum product requirements are not met for this store. Please review paperwork and call form data to ensure all products found in store are entered before you can proceed.")
	                    alert('<%=vPrompts[110]%>')
	                    AbleButtons()
	                    return false;
                    }
				Product_Required=document.aspnetForm.Product_Required.value
			    //alert("ProdDoneAnswer=" + ProdDoneAnswer)
				 //alert("Answer_Check=" + Answer_Check)
				if (Answer_Check=="Y")
					{
						Product_Required=0
					}
				 
							
					 
				    //Product_Required=0
				   // alert("Product_Required2=" + Product_Required)
				  // alert("NumberOfitem=" + NumberOfitem)
				 if (StrCallFormEnded=="")
				    {
				             if (Product_Type!="Y")
				             {
				                    if (Must_Be_Answered_Prod()==false)
								        {
								            AbleButtons()
									        return false;
								        }	
								
				                    if (Product_Required > NumberOfitem)
				                    {
					                    //alert("Minimum product requirements are not met for this store. Please review paperwork and call form data to ensure all products found in store are entered before you can proceed.")
					                    alert('<%=vPrompts[6]%>')
					                    AbleButtons()
					                    return false;
				                    }
				              }
				    }
					//Check for Job 600046 only
					var Bus_Rule_Flag=""
					Job_No=document.aspnetForm.Job_No.value
				 if ((Job_No=="600046") && (Answer_Check=="Y"))
						{
							Bus_Rule_Flag="Y"
						}
				 if (StrCallFormEnded=="")
				    {
				        if ((Product_Type=="Y") && (Bus_Rule_Flag==""))
					        {
						        //Function checks to see if all the products are answered
						        if (ProductsNotAnswered()==false)
							        {
							            AbleButtons()
								        return false;
							        }	
					        }
				     }   
				var ok=confirm('<%=vPrompts[67]%>' + " \n " + '<%=vPrompts[68]%>' + " \n " + '<%=vPrompts[69]%>')
				if (ok)
					{
						document.aspnetForm.action  = "CFProductCallFormAnswer.aspx";
						document.aspnetForm.submit()
						return false;	
					}
				else
					{
						//alert("Please continue with the Internet Call Form.")
						//alert('<%=vPrompts[7]%>')
						 
						AbleButtons()
						return false;
					}	
	 
}

//******************************************Harcode the list of products and must be answered
function Must_Be_Answered_Prod()
{
		Job_No=document.aspnetForm.Job_No.value
//		if ((Job_No=="600046")||(Job_No=="310000")||(Job_No=="9999"))
//		{
								ListOf_Prod=document.aspnetForm.Array_Mandatory_ProdId.value;
							    //alert ("ListOf_Prod=" + ListOf_Prod);
	
								DropDown_Prod=document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value
								// alert("DropDown_Prod=" + DropDown_Prod) 
	
								Array_Of_Prod = ListOf_Prod.split("|");
								arrayProdlen = Array_Of_Prod.length
								 //alert("arraylength=" + arraylength) 
								arrayProdlen=eval(arrayProdlen-1)
								
								for ( g = 0 ; g < arrayProdlen ; g++ )
									{
												Array_Element = Array_Of_Prod[g].valueOf()
												 //alert("Array_Element=" + Array_Element)
										
												Answered_list_Str="SavedList" + Array_Element		
												 //alert("Answered_list_Str=" + Answered_list_Str)
												Prod_Ans_Check=eval("document.aspnetForm." + Answered_list_Str + ".value")
										        // alert("Prod_Ans_Check=" + Prod_Ans_Check)
												if (Prod_Ans_Check=="")
													{
															//alert ("The Product " + Array_Element + " is a Mandatory for this Job, wave, and task.");
															 alert('<%=vPrompts[109]%>')
															//alert ('<%=vPrompts[55]%>' + Array_Element + " " + '<%=vPrompts[56]%>')
																//document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.options[Array_Element].selected = true; 
															//document.aspnetForm.ctl00$ContentPlaceHolder1$SelectedProduct.value=Array_Element
															return false;
													}
//												else
//													{
//														if (DropDown_Prod==Array_Element)
//															{
//															          alert("equal")
//																	//break;
//															}
//														
//													}
									}	
									//document.aspnetForm.SelectedProduct.value=ItemNumber
//									   alert("out")
			//}//Ending of Job_No
}
//********************************* Products that are not answered 

function ProductsNotAnswered()
{
			AllProdNames=document.aspnetForm.AllProdNames.value
			if (AllProdNames!="")
				{	
								ArrayAList = AllProdNames.split("|");
								arraylength = ArrayAList.length
								//alert("arraylength=" + arraylength) 
								arraylength=eval(arraylength-1)
								p=0
								for ( i = 0 ; i < arraylength ; i++ )
									{
											ElementName = ArrayAList[i].valueOf()
											//alert("i=" + i)
											//alert("ElementName=" + ElementName)
											ProdDoneList="SavedList" + ElementName	
											ProdDoneAnswer=eval("document.aspnetForm." + ProdDoneList + ".value")
											//alert("ProdDoneAnswer=" + ProdDoneAnswer)
											if (ProdDoneAnswer=="")
											{
												//alert("Please select " + ElementName + " from the drop menu and answer all the corresponding questions.")
												//alert("Please answer all the corresponding questions for " + ElementName)
												//alert("All products have not been answered. You must answer for all products.")
												alert('<%=vPrompts[8]%>')
												return false;
											}

									}//Ending of For loop
									
				}//Ending of AllProdNames!=""	
}

/************************ Valdation******************************/

function NumericVal(ElementName)
{
					Q_no=ElementName.substring(1,4)
					 //alert("Q_no=" + Q_no)
										
					Ilang_id=document.aspnetForm.ILang_Id.value						
					textBoxValue=eval("document.aspnetForm." + ElementName + ".value")
					textBoxValue2=Number(textBoxValue)
					 //alert("textBoxValue2=" + textBoxValue2)
					if (isNaN(textBoxValue)==true) 
					{
						//alert("The question " + Q_no + " has to be numeric.")
						alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[15]%>')
						return false;
					}
				if (Ilang_id=="10") 
					{			
								if (Trim(textBoxValue2)=="NaN")
									{
										alert('<%=vPrompts[71]%> ' + Q_no + "")
										return false;
									}								
								
							//Decimal Points
								Decimal_Point=document.aspnetForm.Decimal_Point.value
								//alert("Decimal_Point=" + Decimal_Point)
																																				
								DotLen=textBoxValue.indexOf(".")+1
								//alert("DotLen=" + DotLen)
								BoxLen=textBoxValue.length
								//alert("BoxLen=" + BoxLen)
								
								if (DotLen!="0")
									{
											FinalLen=BoxLen-DotLen
											if (FinalLen>Decimal_Point)
												{
													alert('<%=vPrompts[71]%> ' + Q_no + "")
													return false;
												}
									}
						}
					else
						{
								if ((textBoxValue.indexOf("."))>=0)
									{
										alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[16]%> ')
										
										return false;
									}
						}												
			ElementId=eval("document.aspnetForm." + ElementName + ".id")
			//alert("ElementId=" + ElementId)
																
			Pos=ElementId.indexOf(",",2)
			//alert("Pos=" + Pos)
																
			HighValue=ElementId.substring(2,Pos)
			 //alert("HighValue=" + HighValue)
			Pos2=Pos+1
			//alert("Pos=" + Pos)
																
			LastPos=ElementId.length
			//alert("LastPos=" + LastPos)
			LowValue=ElementId.substring(Pos2,LastPos)
			 //alert("LowValue=" + LowValue)
																
																
			if ((eval(LowValue)>eval(textBoxValue2))&&(LowValue!=""))
				{
					//alert("test1")
					//alert("The question " + Q_no + " must be a whole number.")
					alert('<%=vPrompts[57]%> ' + Q_no + ', <%=vPrompts[26]%> ' + LowValue + "")
					return false;
				}
			
			if ((eval(HighValue)<eval(textBoxValue2))&&(HighValue!=""))
				{																						
					//alert("The question "+ Q_no +" value has to less or equal to " + HighValue);
					alert('<%=vPrompts[57]%> ' + Q_no + ', <%=vPrompts[18]%> ' + HighValue + "")
					return false;
				}
			
			
}
function PriceVal(ElementName)
{
	
	//alert("ElementName=" + ElementName)
	Q_no=ElementName.substring(1,4)
															
	textBoxValue=eval("document.aspnetForm." + ElementName + ".value")
	//alert("textBoxValue=" + textBoxValue)
	Price_Rule=document.aspnetForm.Price_Rule.value 
	//alert("Price_Rule=" + Price_Rule)	
												
	ElementId=eval("document.aspnetForm." + ElementName + ".id")
	//alert("ElementId=" + ElementId)
	BoxType=ElementId.substring(2,3)
	//alert("BoxType=" + BoxType)
	Pos=ElementId.indexOf(",",4)
	//alert("Pos=" + Pos)
	HighValue=ElementId.substring(4,Pos)
	//alert("HighValue=" + HighValue)
	Pos2=Pos+1
	//alert("Pos=" + Pos)
													
	LastPos=ElementId.length
	//alert("LastPos=" + LastPos)
	LowValue=ElementId.substring(Pos2,LastPos)
	//alert("LowValue=" + LowValue)
															
	if (BoxType=="D")
		{
				if (textBoxValue!="") 
					{
																						
							if (isNaN(textBoxValue)==true)
								{
									//alert("The question " + Q_no + ",Dollar(s) value has to be numeric.")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[19]%> ')
									return false;
								}
							if ((textBoxValue.indexOf("."))>=0)
								{
									//alert("The question " + Q_no + ", Dollar(s) value can not have a period.")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[20]%> ')
									return false;
								}
							if (textBoxValue<0)
								{
									//alert("The question " + Q_no + " value can not be less than zero")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
									return false;
								}
						//textBoxValue=Number(textBoxValue)
						FirstBox=textBoxValue
					}
				else
					{		
						FirstBox=""
																					
					}
		}
		 //alert("Price_Rule=" + Price_Rule)
		 //alert("FirstBox=" + FirstBox)
	if (Price_Rule=="0" && FirstBox!="")
	{
			 //alert("LowValue=" + LowValue)
			 //alert("HighValue=" + HighValue)		
				FinalValue=FirstBox
				
								if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
									{
										//alert("The question "+ Q_no +", value has to bigger or equal to " + LowValue);
										alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[26]%> ' + LowValue + "")
										return false;
									}
								if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
									{			
										//alert("The question "+ Q_no +", value has to less or equal to " + HighValue);
										alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[27]%> ' + HighValue + "")
										return false;
									}
	}
	if (BoxType=="C")
		{
				if (textBoxValue!="") 
					{
							if ((textBoxValue)>99)
									{
										//alert("The question " + Q_no + ", Cent(s) value can not be bigger than 99 cent.")
										alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[21]%> ')
										return false;
									}
							if (isNaN(textBoxValue)==true)
									{
										//alert("The question " + Q_no + ", Cent(s) value has to be numeric.")
										alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[22]%> ')
										return false;
									}
							if ((textBoxValue.indexOf("."))>=0)
									{
										//alert("The question " + Q_no + ", Cent(s) value can not have a period.")
										alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[23]%> ')
										return false;
									}
							if (textBoxValue<0)
								{
									//alert("The question " + Q_no + " value can not be less than zero")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
									return false;
								}
							//textBoxValue=Number(textBoxValue)
							secondBox=textBoxValue
					}
				else
					{
																		
						secondBox=""	
					}
					//alert("secondBox=" + secondBox);
					//alert("FirstBox=" + FirstBox);
					
					if ((secondBox!="") || (FirstBox!=""))
						{
							if (FirstBox=="")
								{
									FirstBox="0"
									//alert("The question " + Q_no + ", You must enter a value for dollar(s). \n If there is only value for cent(s) then enter 0 for dollar(s).")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[24]%> ' + " \n " + '<%=vPrompts[60]%> ')
									return false;
								}
							
							if (secondBox=="")
								{
									//alert("secondBoxdfdsfsd=" + secondBox);	
									secondBox="0"
									//alert("The question " + Q_no + ", You must enter a value for cent(s). \n If there is only value for dollar(s) then enter 0 for cent(s).")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[25]%> ' + " \n " + '<%=vPrompts[61]%> ')
									return false;
								}
							FinalValue=Number(FirstBox) + "." + Number(secondBox)
							//alert("LowValue=" + LowValue);
							 //alert("PriceFinalValue=" + FinalValue);											
								if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
									{
										//alert("The question "+ Q_no +", value has to bigger or equal to " + LowValue);
										//alert('<%=vPrompts[57]%> ' + Q_no + " " + document.aspnetForm.error_msg[26].value + " " + LowValue + "")
										alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[26]%>' + " " + LowValue + "")
										return false;
									}
								if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
									{			
										//alert("The question "+ Q_no +", value has to less or equal to " + HighValue);
										alert('<%=vPrompts[57]%> ' + Q_no + " " + '<%=vPrompts[27]%>' + " " + HighValue + "")
										return false;
									}
																																									
							FirstBox=""
							secondBox=""
							FinalValue=""
						}	
		}
	
}

function Measurement(ElementName)
{
        
			Q_no=ElementName.substring(1,4)
			//alert("Q_no=" + Q_no)
					
			Inch_Max_Val=document.aspnetForm.Inch_Max_Val.value 
																																
			textBoxValue=eval("document.aspnetForm." + ElementName + ".value")
			//alert("textBoxValue=" + textBoxValue)
																																
			ElementId=eval("document.aspnetForm." + ElementName + ".id")
			//alert("ElementId=" + ElementId)
			BoxType=ElementId.substring(2,3)
			//alert("BoxType=" + BoxType)
			Pos=ElementId.indexOf(",",4)
			//alert("Pos=" + Pos)
			HighValue=ElementId.substring(4,Pos)
			//alert("HighValue=" + HighValue)
			Pos2=Pos+1
			//alert("Pos=" + Pos)
																														
			LastPos=ElementId.length
			//alert("LastPos=" + LastPos)
			LowValue=ElementId.substring(Pos2,LastPos)
			//alert("LowValue=" + LowValue)
															
			if (BoxType=="F")
			{
						if (textBoxValue!="") 
							{
									if (isNaN(textBoxValue)==true)
										{
											//alert("The question " + Q_no + ", Feet(s) value has to be numeric.")
											alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[28]%> ')
											return false;
										}
									if ((textBoxValue.indexOf("."))>=0)
										{
											//alert("The question " + Q_no + ", Feet(s) value can not have a period.")
											alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[29]%> ')
											return false;
										}
									if (textBoxValue<0)
										{
											//alert("The question " + Q_no + " value can not be less than zero")
											alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
											return false;
										}
																										
										FirstBox=textBoxValue
										//alert("FirstValue=" + FirstValue);
							}
						else
							{
								FirstBox=""
							}
			}
			if (BoxType=="I")
			{
																
									if (textBoxValue!="") 
										{
														Inch_Max_Val=Number(Inch_Max_Val)
														
														//alert("Inch_Max_Val=" + Inch_Max_Val);
														//alert("textBoxValue=" + textBoxValue);
														 StrInch_Max_Val=Inch_Max_Val-1
														if (textBoxValue>StrInch_Max_Val)
																{
																	//alert("The question " + Q_no + ", Inch/Inches value can not be bigger than 11.")
																	alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[30]%> ' + " " + StrInch_Max_Val + "")
																	return false;
																}
														if ((textBoxValue)<0)
																{
																	//alert("The question " + Q_no + ", Inch/Inches value can not be less than 0.")
																	alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[31]%> ')
																	return false;
																}
														if (isNaN(textBoxValue)==true)
																{
																	//alert("The question " + Q_no + ", Inch/Inches value has to be numeric.")
																	alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[32]%> ')
																	return false;
																}
														if ((textBoxValue.indexOf("."))>=0)
																{
																	//alert("The question " + Q_no + ", Inch/Inches value can not have a period.")
																	alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[33]%> ')
																	return false;
																}
														if (textBoxValue<0)
																{
																	//alert("The question " + Q_no + " value can not be less than zero")
																	alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
																	return false;
																}
													secondBox=textBoxValue
													//alert("secondBox=" + secondBox);
													secondBox=secondBox/Number(Inch_Max_Val)	
													// alert("DivSecondValue=" + secondBox);
																													
													if (secondBox!=0)	
														{															
															//SecondValue=Math.round(SecondValue)
															secondBox= "" + ((Math.round(secondBox * 10000)) / 10000);
															 //SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
															//alert("secondBox=" + secondBox);
															secondBox=secondBox.substring(2, 6);
															
														}
													if (secondBox==0)	
														{
															secondBox="0"
										}				}
									else
										{
											secondBox=""
										}
																
									if ((secondBox!="") || (FirstBox!=""))
										{
																if (FirstBox=="")
																	{
																		FirstBox="0"
																		//alert("The question " + Q_no + ", You must enter a value for feet(s). \n If there is only value for Inch/Inches then enter 0 for feet(s).")
																		alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[34]%> ' + " \n " + '<%=vPrompts[62]%> ')
																		return false;
																	}
																	
																if (secondBox=="")
																	{
																		
																		secondBox="0"
																		//alert("The question " + Q_no + ", You must enter a value for Inch/Inches. \n If there is only value for feet(s) then enter 0 for Inch/Inches.")
																		alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[35]%> ' + " \n " + '<%=vPrompts[63]%> ')
																		return false;
																	}
																if (secondBox==0)
																	{
																		FinalValue=Number(FirstBox) + "." + 0
																	}
																 else
																	{
																		//FinalValue=Number(FirstBox) + "." + Number(secondBox)
																		FinalValue=Number(FirstBox) + "." +  secondBox
																	}
                                                                    
                                                                 //for display, low and high values
                                                                
                                                                 
						                                           Pos=LowValue.indexOf(".")
													                if (Pos>0)
													                {
													                    LowValueFeet=LowValue.substring(0, Pos);
													                    //alert("LowValueFeet=" + LowValueFeet); 
													                    Pos2=length.LowValue
													                    LowValueInc=LowValue.substring(Pos, Pos2);
													                    LowValueInc=LowValueInc*Number(Inch_Max_Val)
													                    //alert("LowValueMin=" + LowValueMin);
													                    LowValueInc=Math.round(LowValueInc,2)
													                 }
													                 else
													                 {
													                    LowValueFeet=LowValue
													                    LowValueInc=0
													                 }
													                DisplayLowVal=LowValueFeet + "." + LowValueInc
													                // alert("DisplayLowVal=" + DisplayLowVal);  
																	
													                Pos=HighValue.indexOf(".")
													               // alert("Pos=" + Pos);
													                if (Pos>0)
													                {
													                        HighValueFeet=HighValue.substring(0, Pos);
													                       // alert("HighValueFeet=" + HighValueFeet);
													                        Pos2=length.HighValue
													                        HighValueInc=HighValue.substring(Pos, Pos2);
													                        HighValueInc=HighValueInc*Number(Inch_Max_Val)
													                        // alert("HighValueMin=" + HighValueMin);
													                        HighValueInc=Math.round(HighValueInc,2)
													                 }
													                 else
													                 {
													                    HighValueFeet=HighValue
													                    HighValueInc=0   
			                                                         }  
			                                                          DisplayHighVal=HighValueFeet + "." + HighValueInc   
                                                                        //alert("DisplayHighVal=" + DisplayHighVal); 
                                                                    //return false;
															     //alert("IncheFinalValue=" + FinalValue);
															      //alert("LowValue=" + LowValue)
                                                                // alert("HighValue=" + HighValue)
																if (FinalValue!="")
																	{
																			if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
																				{
																					//alert("The question "+ Q_no +" value has to bigger or equal to " + LowValue);
																					//alert('<%=vPrompts[57]%> ' + Q_no + " " +  ' <%=vPrompts[36]%> ' + DisplayLowVal + "")
																					alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[36]%>' + " " + LowValueFeet + " " + '<%=vPrompts[96]%>' + " and " + LowValueInc + " " + '<%=vPrompts[97]%>' + ".");
																					return false;
																				}
																			if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
																				{
																																																															
																					//alert("HighValue=" + HighValue);
																					//alert("textBoxValue=" + textBoxValue);
																																																																
																					//alert("The question "+ Q_no +" value has to less or equal to " + HighValue);
																					//alert('<%=vPrompts[57]%> ' + Q_no + " " + ' <%=vPrompts[37]%> ' + DisplayHighVal + "")
																					alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[37]%>' + " " + HighValueFeet + " " + '<%=vPrompts[96]%>' + " and " + HighValueInc + " " + '<%=vPrompts[97]%>' + ".");	
																					return false;
																				}
																																																										
																		FirstBox=""
																		secondBox=""
																		FinalValue=""
																	}
															
											}//ending of variable set to nothing																				
																																				
				}//end of inche if statement
					
}
function Time(ElementName)
{
		Q_no=ElementName.substring(1,4)
		//alert("Q_no=" + Q_no)
																																											
		textBoxValue=eval("document.aspnetForm." + ElementName + ".value")
		//alert("textBoxValue=" + textBoxValue)
																																											
		ElementId=eval("document.aspnetForm." + ElementName + ".id")
		//alert("ElementId=" + ElementId)
		BoxType=ElementId.substring(2,3)
		//alert("BoxType=" + BoxType)
		Pos=ElementId.indexOf(",",4)
		//alert("Pos=" + Pos)
		HighValue=ElementId.substring(4,Pos)
	   // alert("HighValue=" + HighValue)
		Pos2=Pos+1
		//alert("Pos=" + Pos)
																																									
		LastPos=ElementId.length
		//alert("LastPos=" + LastPos)
		LowValue=ElementId.substring(Pos2,LastPos)
		// alert("LowValue=" + LowValue)
																										
		if (BoxType=="H")
		{
			if (textBoxValue!="") 
				{
						if (isNaN(textBoxValue)==true)
							{
								//alert("The question " + Q_no + ", Hour(s) value has to be numeric.")
								alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[38]%> ')
								return false;
							}
						if ((textBoxValue.indexOf("."))>=0)
							{
								//alert("The question " + Q_no + ", Hour(s) value can not have a period.")
								alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[39]%> ')
								return false;
							}
						if (textBoxValue<0)
								{
									//alert("The question " + Q_no + " value can not be less than zero")
									alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
									return false;
								}																														
							FirstBox=textBoxValue
							//alert("FirstValue=" + FirstValue);
				}
			else
				{
					FirstBox=""
				}
		}
		if (BoxType=="M")
		{
																											
						if (textBoxValue!="") 
							{
											if ((textBoxValue)>59)
													{
														//alert("The question " + Q_no + ", Minute(s) value can not be bigger than 59.")
														alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[40]%> ')
														return false;
													}
											if ((textBoxValue)<0)
													{
														//alert("The question " + Q_no + ", Minute(s) value can not be less than 0.")
														alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[41]%> ')
														return false;
													}
											if (isNaN(textBoxValue)==true)
													{
														//alert("The question " + Q_no + ",Minute(s) value has to be numeric.")
														alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[42]%> ')
														return false;
													}
											if ((textBoxValue.indexOf("."))>=0)
													{
														//alert("The question " + Q_no + ", Minute(s) value can not have a period.")
														alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[43]%> ')
														return false;
													}
											if (textBoxValue<0)
													{
														//alert("The question " + Q_no + " value can not be less than zero")
														alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[70]%> ')
														return false;
													}																
										secondBox=textBoxValue
										//alert("SecondValue=" + SecondValue);
										secondBox=secondBox/60	
									//alert("DivSecondValue=" + secondBox);
																																								
										if (secondBox!=0)
											{																														
												//SecondValue=Math.round(SecondValue)
											    secondBox= "" + ((Math.round(secondBox * 10000)) / 10000);
												//SecondValue= "" + ((Math.round(SecondValue * 10000)) / 10000);
												 //alert("secondBox=" + secondBox);
												secondBox=secondBox.substring(2, 6);
											}
											if (secondBox==0)
											{	
												secondBox="0"	
											}	
							}
						else
							{
								secondBox=""
							}
																											
						if ((secondBox!="") || (FirstBox!=""))
							{
													if (FirstBox=="")
														{
															FirstBox="0"
															//alert("The question " + Q_no + ", You must enter a value for Hour(s). \n If there is only value for Minute(s) then enter 0 for Hour(s).")
															alert('<%=vPrompts[57]%> ' + Q_no + ", " + ' <%=vPrompts[44]%> ' + " \n " + '<%=vPrompts[64]%> ')
															return false;
														}
													if (secondBox=="")
														{
															secondBox="0"
															//alert("The question " + Q_no + ", You must enter a value for Minute(s). \n If there is only value for Hour(s) then enter 0 for Minute(s).")
															alert('<%=vPrompts[57]%> ' + Q_no + ", " + '<%=vPrompts[45]%> ' + " \n " + '<%=vPrompts[65]%> ')
															return false;
														}
													if (secondBox==0)
														{
															FinalValue=Number(FirstBox) + "." + 0
														}
													 else
														{
															FinalValue=Number(FirstBox) + "." + secondBox 
														}

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
											                DisplayLowValue=LowValueHour + "." + LowValueMin
											                 //alert("hourLowValue=" + DisplayLowValue);  
															
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
	                                                          DisplayHighValue=HighValueHour + "." + HighValueMin
											                 //alert("hoursHighValue=" + DisplayHighValue);
											                  //alert("FinalValue=" + FinalValue)
                                                               //  alert("LowValue=" + LowValue)
                                                               //  alert("HighValue=" + HighValue)

												//alert("HourFinalValue=" + FinalValue);
													if (FinalValue!="")
														{
																if ((eval(LowValue)>eval(FinalValue))&&(LowValue!=""))
																	{
																		//alert("The question "+ Q_no +" value has to bigger or equal to " + LowValue);
																		//alert('<%=vPrompts[57]%> ' + Q_no + ' <%=vPrompts[64]%> ' + LowValue + "")
																		//alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[36]%>' + " " + LowValueHour + " hour(s) and " + LowValueMin + " minute(s).");	
																		alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[36]%>' + " " + LowValueHour + " " + '<%=vPrompts[98]%>' + " and " + LowValueMin + " " + '<%=vPrompts[99]%>' + ".");
																		return false;
																	}
																if ((eval(HighValue)<eval(FinalValue))&&(HighValue!=""))
																	{
																																																																											
																		//alert("The question "+ Q_no +" value has to less or equal to " + HighValue);
																		//alert('<%=vPrompts[57]%> ' + Q_no + ' <%=vPrompts[47]%> ' + HighValue + "")
																		 alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[37]%>' + " " + HighValueHour + " " + '<%=vPrompts[98]%>' + " and " + HighValueMin + " " + '<%=vPrompts[99]%>' + ".");
																		return false;
																	}
																																																																					
															FirstBox=""
															secondBox=""
															FinalValue=""
														}
																										
								}//ending of variable set to nothing																				
																																															
		}//end of inche if statement
}

function isValidDate(dateStr)
{
		Str_Divid_dt=""

		Date_sys_rule=document.aspnetForm.DateRule.value
	  // alert("Date_sys_rule=" + Date_sys_rule)

		Dash_Pos=Date_sys_rule.indexOf("-")
		Dot_Pos=Date_sys_rule.indexOf(".")
		Slash_Pos=Date_sys_rule.indexOf("/")
		
		if (Dash_Pos>0)
			{
				Str_Divid_dt="-"
			}
			
		if (Dot_Pos>0)
			{
				Str_Divid_dt="."
			}
		if (Slash_Pos>0)
			{
				Str_Divid_dt="/"
			}
		// alert("Str_Divid_dt=" + Str_Divid_dt)
		Input_Date_Pos=dateStr.indexOf(Str_Divid_dt)
		 //alert("Input_Date_Pos=" + Input_Date_Pos)
		
		
		//Rep input date
			Input_Date_Array = dateStr.split(Str_Divid_dt)
			//alert("Input_Date_Array=" + Input_Date_Array[0])
			EnterDate_len=Input_Date_Array.length;
			 // alert("EnterDate_len=" + EnterDate_len)
		  if (EnterDate_len>3)
			{
				alert('<%=vPrompts[66]%> ')
				return false;
			} 
			
		//System rule date
			Date_Sys_Rule_Array= Date_sys_rule.split(Str_Divid_dt)
		
		
		for(y=0; y<Date_Sys_Rule_Array.length; y++)
		{
			if (Date_Sys_Rule_Array[y] == "mm")
			{
				Var_month = Input_Date_Array[y];
				if (Var_month==undefined)
					{
						Input_Mon_Len=0
					}
				else
					{
						Input_Mon_Len=Var_month.length
					}
				Sys_Rule_Mon_Len=Date_Sys_Rule_Array[y].length
				
			}
			if (Date_Sys_Rule_Array[y] == "dd")
			{
				Var_day = Input_Date_Array[y];
				if (Var_day==undefined)
					{
						Input_day_Len=0
					}
				else
					{
						Input_day_Len=Var_day.length
					}
				
				Sys_Rule_day_Len=Date_Sys_Rule_Array[y].length
			}
			if (Date_Sys_Rule_Array[y] == "yy" || Date_Sys_Rule_Array[y] == "yyyy" )
			{
				Var_year = Input_Date_Array[y];
				if (Var_year==undefined)
					{
						Input_year_Len=0
					}
				else
					{
						Input_year_Len=Var_year.length
					}
				
				Sys_Rule_year_Len=Date_Sys_Rule_Array[y].length
			}
		}
//		 alert("Var_month=" + Var_month)
//		 alert("Var_day=" + Var_day)
//		  alert("Var_year=" + Var_year)
		 
		// alert("Sys_Rule_Mon_Len=" + Sys_Rule_Mon_Len)
		// alert("Input_Mon_Len=" + Input_Mon_Len)
		 
		// alert("Sys_Rule_day_Len=" + Sys_Rule_day_Len)
		// alert("Input_day_Len=" + Input_day_Len)
		
//		 alert("Sys_Rule_year_Len=" + Sys_Rule_year_Len)
		// alert("Input_year_Len=" + Input_year_Len)
		
//		if (Input_Mon_Len!=Sys_Rule_Mon_Len)
//			{
//				alert('<%=vPrompts[66]%> ')
//				return false;
//			}
//		if (Input_day_Len!=Sys_Rule_day_Len)
//			{
//				alert('<%=vPrompts[66]%> ')
//				return false;
//			}
		if (Input_year_Len!=Sys_Rule_year_Len)
			{
				alert('<%=vPrompts[66]%> ')
				return false;
			}
			
		
			
		if (Var_month==undefined)
			{
				return false;
			}
		if (Var_day==undefined)
			{
				return false;
			}
		if (Var_year==undefined)
			{
				return false;
			}
		
	 if (isNaN(Var_month)==true)
		{  
		    alert('<%=vPrompts[66]%> ')
			return false;
		}					                                                            
	 if (isNaN(Var_day)==true)
		{  
		    alert('<%=vPrompts[66]%> ')
			return false;
		}	
     if (isNaN(Var_year)==true)
		{ 
		    alert('<%=vPrompts[66]%> ')
			return false;
		}	
	if (Var_month < 1 || Var_month > 12) 
		{ // check month range
			//alert("Month must be between 1 and 12.");
			alert('<%=vPrompts[48]%> ')
			return false;
		}
	if (Var_day < 1 || Var_day > 31) 
		{
			//alert("Day must be between 1 and 31.");
			alert('<%=vPrompts[49]%> ')
			return false;
		}
	if ((Var_month==4 || Var_month==6 || Var_month==9 || Var_month==11) && Var_day==31) 
		{
			//alert("Month "+month+" doesn't have 31 days!")
			alert('<%=vPrompts[50]%> ' + Var_month + " " + '<%=vPrompts[51]%> ')
			
			return false
		}
	if (Var_month == 2) 
		{ // check for february 29th
			var isleap = (Var_year % 4 == 0 && (Var_year % 100 != 0 || Var_year % 400 == 0));
			
			if (Var_day>29 || (Var_day==29 && !isleap)) 
				{
					//alert("February " + year + " doesn't have " + day + " days!");
					alert('<%=vPrompts[52]%> ' + Var_year + '<%=vPrompts[53]%> ' + Var_day + " " + '<%=vPrompts[54]%> ')
	
					return false;
				}
		}
		
 //******************** Date can not be less 1/1/1900 and bigger than 6/6/2079
     if (Sys_Rule_year_Len==2)
		{	
				EnterDate="" + Var_month + "/" + Var_day + "/20" + Var_year	
				 		
		}
	else
		{
			    EnterDate="" + Var_month + "/" + Var_day + "/" + Var_year	
			  	
		}
			
		if (Date.parse(EnterDate)<Date.parse('01/01/1900'))
		{
		     alert('<%=vPrompts[66]%> ')
			 return false;
		}
	 

		if (Date.parse(EnterDate)>Date.parse('06/06/2079'))
		{
		     alert('<%=vPrompts[66]%> ')
			 return false;
		}
	return true;  // date is valid
}
//******************************************************* date validate	 																			
function DateHighLowCheck(dateStr,ElementName)
{
            Date_sys_rule=document.aspnetForm.DateRule.value
            //alert("DateHighLowCheck="+ dateStr);
            	Q_no=ElementName.substring(1,4)
		 //alert("Q_no=" + Q_no)
																																											
		textBoxValue=eval("document.aspnetForm." + ElementName + ".value")
		 //alert("textBoxValue=" + textBoxValue)
																																											
		ElementId=eval("document.aspnetForm." + ElementName + ".id")
		// alert("ElementId=" + ElementId)
		Pos=ElementId.indexOf(",",2)
	    //alert("Pos=" + Pos)
    														
	    HighValue=ElementId.substring(2,Pos)
	     //alert("HighValue=" + HighValue)
	    Pos2=Pos+1
	    //alert("Pos=" + Pos)
    														
	    LastPos=ElementId.length
	    //alert("LastPos=" + LastPos)
	    LowValue=ElementId.substring(Pos2,LastPos)
	    // alert("LowValue=" + LowValue)
		
  
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
//		  alert("LowValue00="+ LowValue);
//		  alert("HighValue00="+ HighValue);
//		 alert("LenLowValue="+ LenLowValue);
//		 alert("LenHighValue="+ LenHighValue);

        SubLowValue=LowValue
		SubLowLen=SubLowValue.length
		SubHighValue=HighValue
		SubHighLen=SubHighValue.length
		
		E_delimiter=document.aspnetForm.Date_input.value
		// alert("E_delimiter="+ E_delimiter);
		 // alert("dateStr="+ dateStr);	
		var StrDatearray = dateStr.split(E_delimiter)
		
		DateRulearray = Date_sys_rule.split(E_delimiter)
	 //alert("Date_sys_rule="+ Date_sys_rule);
		
         
            
          
	
		
            //StrDate,LowValue,HighValue,v_date_sys_rule,Question
 
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
		
//			alert("EnterDate="+ EnterDate);
//			alert("LowValue="+ LowValue);c
//			alert("HighValue="+ HighValue);
			
//			alert("Year_Size="+ Year_Size);
//			alert("v_month="+ v_month);
//			alert("v_day="+ v_day);
//			alert("v_year="+ v_year);
	
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
			
//			alert("LowDatefin="+ LowDate);
//			alert("HighDatefin="+ HighDate);
//			alert("EnterDate="+ EnterDate);

		if (LowValue!=0)
			{
				if (Date.parse(EnterDate)<Date.parse(LowDate))
				{
					//alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[2].value + " " + DisplayLowDate);
					alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[46]%>' + " " + DisplayLowDate);

					//result = false;																												
					return false;
				}
			}
		if (HighValue!=0)
			{if (Date.parse(EnterDate)>Date.parse(HighDate))
				{
				
						//alert(document.aspnetForm.error_msg[0].value + " "+ Question +", " + document.aspnetForm.error_msg[3].value + " " + DisplayhighDate);
						alert('<%=vPrompts[57]%>' + " " + Q_no + ", " + '<%=vPrompts[47]%>' + " " + DisplayhighDate);
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

//******************************************** Put focus on the element 	
		
function ElementOnFocus(FocusType)
{
		//TextProdNumber = document.aspnetForm.EnterProduct.value
			//alert("TabKey=" + event.keyCode)
			
			//alert("FocusType=" + FocusType)
		if (FocusType=="TextBox")
			{	
				//ProdForSaving="QList" + document.aspnetForm.SelectedProduct.value	
				//ProdQNames=eval("document.aspnetForm." + ProdForSaving + ".value")
				ProdQNames=document.aspnetForm.ControlList.value 
	            //alert("ProdQNames=" + ProdQNames)
	                 
				//alert("ProdQNames=" + ProdQNames)
	
				ProdListArray = ProdQNames.split("|");
				ProdQNum = ProdListArray[0].valueOf()
				//alert("ProdQNum=" + ProdQNum)
				Anstype = ProdQNum.substring(0,1)
				if (Anstype=="N" || Anstype=="T" || Anstype=="D" || Anstype=="P" || Anstype=="H" || Anstype=="M")
					{
						eval("document.aspnetForm." + ProdQNum + ".focus()");
						eval("document.aspnetForm." + ProdQNum + ".select()");
					}
				if (Anstype=="R" || Anstype=="L" || Anstype=="C")
				{
					//alert("AnstypeTest=" + Anstype)
					//eval("document.aspnetForm." + ProdQNum + "[0].checked=true")
					eval("document.aspnetForm." + ProdQNum + "[0].focus()");
					//eval("document.aspnetForm." + ProdQNum + "[0].select()");
					
				}
				
			}
		if (FocusType=="DropMenu")
			{	
			    ProdQNames=document.aspnetForm.ControlList.value 
	            //alert("ProdQNames=" + ProdQNames)
				//alert("ProdQNames=" + ProdQNames)
	
				ProdListArray = ProdQNames.split("|");
				ProdQNum = ProdListArray[0].valueOf()
				//alert("ProdQNum=" + ProdQNum)
				Anstype = ProdQNum.substring(0,1)
				if (Anstype=="N" || Anstype=="T" || Anstype=="D" || Anstype=="P" || Anstype=="H" || Anstype=="M" || Anstype=="C")
					{
						//alert("ProdQNum=" + ProdQNum)
						eval("document.aspnetForm." + ProdQNum + ".focus()");
						eval("document.aspnetForm." + ProdQNum + ".select()");
					}
				if (Anstype=="R" || Anstype=="L")
				{
					//alert("AnstypeTest=" + Anstype)
					//eval("document.aspnetForm." + ProdQNum + "[0].checked=true")
					eval("document.aspnetForm." + ProdQNum + "[0].focus()");
					//eval("document.aspnetForm." + ProdQNum + "[0].select()");
					
				}
			}
		if (FocusType=="NextProduct")
			{	
				//alert("Test=" + FocusType)
			
						//eval("document.aspnetForm.EnterProduct.focus()");
						//eval("document.aspnetForm.EnterProduct.select()");

			}
		
	
}

function EnterText(CounterBoxName,TextBoxName)
{
		//alert("TextBoxName=" + TextBoxName);
		TextLen=eval("document.aspnetForm." + TextBoxName + ".value.length")
		//alert("TextLen=" + TextLen);
		//document.test." + CounterBoxName + ".value=TextLen
		eval("document.aspnetForm." + CounterBoxName + ".value=TextLen")
}
function Question_One_Check(ArrayElement,NextQuestion)
{
	//alert("NextQuestion=" + NextQuestion)
	Job_No=document.aspnetForm.Job_No.value
	if ((Job_No=="600046"))
		{

						C=eval("document.aspnetForm." + ArrayElement + ".length")
						//alert("k55=" + k)	
						LenCheck=String(C)
						if (LenCheck=="undefined")
								{
													eval("document.aspnetForm." + ArrayElement + ".checked=false")
												
								}					
						else
								{
											for (M=0; M<C; M++)
												{
													//alert("M=" + M)	
													Question_checked=eval("document.aspnetForm." + ArrayElement + "[M].checked")
													if (NextQuestion=="0")
														{
															//alert("Question_checked=" + Question_checked)
															if (Question_checked==true)
															{
																Disabled_Buttons('N')
															}	
														}
													if (NextQuestion!="0")
														{
															//alert("Question_checked=" + Question_checked)
															if (Question_checked==true)
															{
																Avaiabled_Buttons('N')
															}	
														}
													
												}
								}//Ending of LenCheck=="undefined"
								
			}//ending of Job_No=="310006")||(Job_No=="310000"
		
}
function Disabled_Buttons(Flag)
{
	
	document.aspnetForm.Save_One_Answer.value='Y'
	
	document.aspnetForm.EnterProduct.disabled=true
	document.aspnetForm.Next.disabled=true
	document.aspnetForm.Back.disabled=true
	document.aspnetForm.Reset.disabled=true
	if (Flag=="N")
		{
			document.aspnetForm.SelectedProduct.disabled=true	
		}
}
function Avaiabled_Buttons(Flag)
{
	document.aspnetForm.Save_One_Answer.value=''
	document.aspnetForm.EnterProduct.disabled=false
	document.aspnetForm.Next.disabled=false
	document.aspnetForm.Back.disabled=false
	document.aspnetForm.Reset.disabled=false
	if (Flag=="N")
		{
			document.aspnetForm.SelectedProduct.disabled=false	
		}
		
}
function Back_click()
	{
	   document.aspnetForm.action = "CFJWTInputs.aspx";
	   document.aspnetForm.submit();
	   return true;	
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
function TextCheckOnly(evt)
{
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;
    //alert("charCode=" + charCode);
    //***** charCode=13 is Enter key
    ILang_Id=document.aspnetForm.ILang_Id.value	
    // for character |
    if (charCode==124)
	{
		return false;
    }
    // for character >
     if (charCode==62)
	{
		return false;
    }
    // for character <
     if (charCode==60)
	{
		return false;
    }
    // for character ,
     if (charCode==44)
	{
		return false;
    }
    
    
   

	return true;
}

</script>
 
<hr color="dodgerblue" />
<asp:Table ID="Table2" runat="server" width="100%" BorderWidth="0" bordercolor="dodgerblue">
<asp:TableRow>
    <asp:TableCell HorizontalAlign="Left" >
           <asp:Table ID="Table1" runat="server" width="100%"  BorderWidth="0" bordercolor="dodgerblue">
            <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader" >
                        <asp:Label ID="Label3" runat="server" Text="Job No."  CssClass="reportCriteriaHeader"></asp:Label>  
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem" >
                        :<%=Job_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label4" runat="server" Text="Wave No."   CssClass="reportCriteriaHeader"></asp:Label>  
                           
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Wave_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label5" runat="server" Text="Task No."  CssClass="reportCriteriaHeader"></asp:Label>     
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Task_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                 <asp:Label ID="Label6" runat="server" Text="Chain No."  CssClass="reportCriteriaHeader"></asp:Label>     
                         
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                        :<%=Chain_No%>
                </asp:TableCell>
            </asp:TableRow> 
             <asp:TableRow>
                <asp:TableCell Width="10%" CssClass="reportCriteriaHeader">
                <asp:Label ID="Label7" runat="server" Text="Store No."  CssClass="reportCriteriaHeader"></asp:Label>     
                
                </asp:TableCell>
                  <asp:TableCell Width="90%" CssClass="selectionCriteriaItem">
                       :<%=Store_No%>
                </asp:TableCell>
            </asp:TableRow> 
            
         </asp:Table>

    </asp:TableCell>
</asp:TableRow> 
</asp:Table>

<hr color="dodgerblue" />
 
<center>

<%
    if (No_Question_avaliable == "0")
    {
         if (CheckErrorMessage != "N")
            {   
            %>
              <br />
              <strong><font color="Red" size="3"><%=CheckErrorMessage%></font></strong>
            <%
            }
            else
            {    
            %>   
              <br />
              <strong><font color="Red" size="3">No questions setup for this Job, Wave, and Tasks</font></strong>
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

                        <asp:table    runat="server" id="table16" BorderColor="dodgerblue"  BorderWidth="1"  cellpadding="1" cellspacing="1" width="100%">
                             
                             <asp:TableRow>
                               <asp:TableCell   Width="30%" HorizontalAlign="Right" CssClass="selectionCriteriaItem">
                                <asp:Label ID="Label17" runat="server" Text="Enter Product No:"  CssClass="reportCriteriaHeader"></asp:Label> 
                                <input type='text' name="EnterProduct" id="prodid"  onkeypress="return ProdSearch()" />
                              
                               </asp:TableCell>
                                         
                               <asp:TableCell  Width="70%" HorizontalAlign="Left" CssClass="selectionCriteriaItem">
                                         <%
                                             //Manager_Title.SelectedValue  = Str_Manager_Title;	  autopostback="true"									     
                                         %>
                                              <asp:DropDownList runat="server" ID="SelectedProduct" >
                                                  <asp:ListItem> </asp:ListItem>
                                              </asp:DropDownList >      
                              </asp:TableCell>
                            </asp:TableRow>											
                         </asp:table> 
                            
                        <asp:table runat="server" id="table3" BorderColor="dodgerblue"  BorderWidth="0"  cellpadding="1" cellspacing="1" width="100%">
                             <asp:TableRow>
                               <asp:TableCell BackColor="#336699" CssClass="reportTableHeader" BorderColor="dodgerblue" HorizontalAlign="Left" Wrap="false">
                                         <div id="ProdHeader"></div>
                               </asp:TableCell>
                            </asp:TableRow>	
                             <asp:TableRow>
                               <asp:TableCell  HorizontalAlign="Right" CssClass="reportTableHeader">
                                        <div id="ProdQuestion"></div>
                               </asp:TableCell>
                            </asp:TableRow>											
                         </asp:table> 
                         
                         <asp:table runat="server" id="table4" BorderColor="dodgerblue"     cellpadding="1" cellspacing="1" width="100%">
                             <asp:TableRow>
                                 <asp:TableCell  Width="5%" CssClass="reportTableHeader" >
                                        <asp:Button  OnClientClick="return NextProduct();return false;" ID="Button2"  runat="server" Text="Next >>" CssClass="Button"></asp:Button>
                                            
                                 </asp:TableCell>
                             
                                <asp:TableCell Width="5%"  CssClass="reportTableHeader" >
                                        <asp:Button  OnClientClick="return BackProduct();return false;" ID="Button5"  runat="server" Text="<< Back" CssClass="Button"></asp:Button>
                                        
                                </asp:TableCell>
                            
                                 <asp:TableCell Width="5%" CssClass="reportTableHeader" >        
                                        <asp:Button  OnClientClick="return ResetProduct()" ID="Button6"  runat="server" Text="Reset" CssClass="Button"></asp:Button>
                                         
                                 </asp:TableCell>
                             
                                <asp:TableCell Width="85%" HorizontalAlign="Right" CssClass="reportTableHeader" >       
                                        <asp:Button  OnClientClick="return SaveProductNextPage()" ID="Button7"  runat="server" Text="Call Form Completed" CssClass="Button"  ></asp:Button>
                                </asp:TableCell>
                            </asp:TableRow>											
                         </asp:table>                  
                         
                        </center>
                        <%=DisplayJWTQuestionsInfo%>

                        <%=DisplayResponseInfo%>

                        <%=DisplaySaveHiddenInfo%>
                        
                        <%=Report_Answers_Hidden_var%>
                          
                        <%=HH_Ans_Display_Hidden_var%>

<%
    }//end of if (No_Question_avaliable == "0")
%>
<input name="CFHeaderInfo" type="hidden" value="<%=DisplayHeaderInfo%>" />
<input name="CFQuestionInfo" type="hidden" value="<%=DisplayQuestLinkInfo%>" />
<input name="CFAnsTypeInfo" type="hidden" value="<%=DisplayAnsTypeInfo%>" />
<input name="CFResponseInfo" type="hidden" value="" />
<input name="CFControlInfo" type="hidden" value="<%=DisplayControlInfo%>" />
<input name="CFHdrAnsInfo" type="hidden" value="" />
<input name="ProdAnsForNextPage" type="hidden" value="<%=ProdAnsForNextPage%>"/>
<input name="ProcedureProdNextPage" type="hidden" value="<%=StrProdNextPage%>"/>
<input name="ProcedureMenu_Array_no" type="hidden" value="<%=strMenu_Array_no%>"/>
	
<input name="AnswersAllFromGrid" type="hidden" value="<%=AnswersAllFromGrid%>"/>

<input name="AnswersForMenuColor" type="hidden" value="<%=AnswersForMenuColor%>"/>
<input name="TotalProdCount" type="hidden" value="<%=TotalProdCount%>"/>	
<input name="AllProdNames" type="hidden"  value="<%=ProductElementAll%>"/>
<input name="Product_Required" type="hidden" value="<%=Product_Required%>"/>

<asp:HiddenField ID="SaveDataTable" runat="server" value="" />
<input type="hidden" name="ControlList" value=""/> 	
<input type="hidden" name="Menu_id" value=""/> 	
<input type="hidden" name="Prod_id" value=""/> 	
<input type="hidden" name="MustBeAnswered_prod" value=" "/>
<input name="InformationDisplay" type="hidden" value="" />	
<input name="SavedProdForAnswer" type="hidden" value=""/>
<input type="hidden" name="InputidsAnswersAll" value=""/>

<input name="JWTInfoRTS" type="hidden" value="<%=JWTInfoRTS%>" />	
<input name="Hidden_date" type="hidden" value="" />	
<input name="Visit_Date" type="hidden" value="<%=Visit_Date%>" />	
<input name="txt_midnight" type="hidden" value="" />
<input name="Job_No" type="hidden" value="<%=Job_No%>" />
<input name="Wave_No" type="hidden" value="<%=Wave_No%>" />
<input name="Task_No" type="hidden" value="<%=Task_No%>" />
<input name="Task_Desc" type="hidden" value="<%=Task_Desc%>" />
<input name="Task_Addtl_Desc" type="hidden" value="<%=Task_Addtl_Desc%>" />
<input name="Product_Type" type="hidden" value="<%=Product_Type%>"/>

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

<input name="Save_One_Answer" type="hidden" value=""/> 
<input name="CF_ILang_Id" type="hidden" value="<%=Lang_id%>"/>
<input name="ShortCallForm" type="hidden" value="<%=ShortCallForm%>" id="Hidden1"/>
<input name="Used_qty" type="hidden" value="<%=Used_qty%>" id="Hidden2"/>
<input name="Date_input" type="hidden" value="<%=Date_input%>" id="Hidden3"/>
<input name="Price_Rule" type="hidden" value="<%=Decimal_Point%>"/>
<input name="Inch_Max_Val" type="hidden" value="<%=MeasurementValue%>"/>
<input name="CheckTo_Erase_Answers" type="hidden" value=""/>
<input name="CallFormEnded" type="hidden" value="<%=CallFormEnded%>"/>
<input name="Procedure_CallFormEnded_List" type="hidden" value="<%=CallFormEnded_List%>"/>

<input name="CFEnd_SelectedProduct" type="hidden" value="<%=CFEnd_SelectedProduct%>"/>
<input name="CFEnd_Q_no" type="hidden" value=""/>
<input name="AnyProduct_answered" type="hidden" value=""/>
<input name="Array_Mandatory_products" type="hidden" value="<%=Array_Mandatory_products%>"/>
<input name="Array_Mandatory_ProdId" type="hidden" value="<%=Array_Mandatory_ProdId%>"/>
<input name="Q_no_999" type="hidden" value=""/>
<input name="Ans_val_999" type="hidden" value=""/>
<input name="NewScreenPage" type="hidden" value="<%=NewScreenPage%>"/>
<Input type=hidden name="chainstorelstSA" value="<%=chainstorelstSA%>"/>
<Input type=hidden name="selchainstoreSA" value="<%=selchainstoreSA%>"/>
<input name="Str_Sv_Panel_id" type="hidden" value="<%=Str_Sv_Panel_id%>" />
</asp:Content>

