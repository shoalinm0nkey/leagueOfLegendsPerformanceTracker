<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ranks</title>
    </head>
    <body>
        <table>
            <tr>
                <td>
                    Ranks
                </td>
            </tr>

            <c:forEach items="${ranks}" var="rank">
                <tr><td><c:out value="${rank.getRankName()}" /></td></tr>
            </c:forEach>
        </table>
    </body>
</html>