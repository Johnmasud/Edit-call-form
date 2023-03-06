
<%@ Application Language="C#" %>

<script runat="server">
    // Donot remove or alter the below code, adding code is allowed
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {         
        // Donot remove the below code
        Exception objErr = Server.GetLastError().GetBaseException();
        
       ErrHandler.WriteError(objErr);
          
         
    }

    void Session_Start(object sender, EventArgs e) 
    {
       
          
        
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        

    }
       
</script>
