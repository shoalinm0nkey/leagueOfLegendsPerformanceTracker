package edu.matc.controller;

import edu.matc.persistence.RankData;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(
        urlPatterns = {"/allRanks"}
)

public class Ranks extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RankData rankData = new RankData();
        req.setAttribute("ranks", rankData.getAllRanks());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/ranks.jsp");
        dispatcher.forward(req, resp);
    }
}