<%
   Call ConnOpen()
   rs.Open "SELECT TOP 10 * FROM mensagens ORDER BY id DESC", cn, 1
   If rs.EOF = False Then
       With Response
           While rs.EOF = False
               .Write "<b>" & rs("username") & "</b><br>"
               .Write rs("messaggio") & "<br><br>"
           rs.MoveNext
           Wend
       End With
   End If
   rs.Close
   Call ConnClose()
%>