<%-- 
    Document   : AfficherDemandeInd
    Created on : 1 janv. 2020, 00:10:09
    Author     : singleton
--%>

<%@page import="dao.dataAccess"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="dbutil.JavaConnect"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!doctype html>

<html class="no-js" lang="">


    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Afficher Dossier </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="favicon.ico">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/transitions.css">
        <link rel="stylesheet" href="css/prettyPhoto.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/pogoslider.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}
        </style>
    </head>

    <body>
        <%
            String formulaire_id = (String) request.getAttribute("formulaire_id");
            String idform = request.getParameter("idform");
            
            if (idform == null) {
                idform = formulaire_id;
            }
            
            String typex = (String) request.getAttribute("type");
            String type = request.getParameter("type");
             if (type == null) {
                type = typex;
            }
            
            String ix = request.getParameter("id");
            String idx = (String) request.getAttribute("id");
            String tpe = (String) request.getAttribute("tpe");
            if (idx == null) {
                idx = ix;
            }
            //ix = "1";
            String sql = "SELECT * FROM loginadmin where Id=?";
            Connection con = new JavaConnect().createConnection();
            PreparedStatement pst, pst1;
            try {

                // String idx = "0";
                pst = con.prepareStatement(sql);
                pst.setString(1, ix);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    System.out.println("hello 4");
                    String id = rs.getString(1);
                    String Prenom = rs.getString(2);
                    String nom = rs.getString(3);
                    String Civilite = rs.getString(4);
        %>    <!--************************************
                            Loader Start
            *************************************-->
        <div class="lds-roller">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        <!--************************************
                            Loader End
            *************************************-->
        <!--************************************
                            Wrapper Start
            *************************************-->
        <div id="at-wrapper" class="at-wrapper">
            <!--************************************
                                    Header Start
                    *************************************-->
             <header id="at-header" class="at-header at-headervthree">
                <div class="container-fluid">
                    <div class="row">
                        <strong class="at-logo"><a href="index.html"><img src="images/logo2.png" alt="company logo here"><span class="at-contactnumber"> <i class="icon-telephone114"></i> <em>+00221 33 837 80 09</em> </span></a></strong>
                                      
                        <div class="at-navigationarea">
                            <nav id="at-nav" class="at-nav">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#at-navigation" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                               <div id="" class="collapse navbar-collapse at-navigation">
                                    <ul>
                                        <li>
                                       <a href="AfficherDemandeCol.jsp?id=<%=ix%>" class="" style="border:2px solid black; background-color: #fc9393; font-family: sans-serif" role="button">AFFICHER INSCRIPTION COLLECTIVE</a>
                                       </li>
                                        <li>
                                       <a href="AfficherDemandeInd.jsp?id=<%=ix%>" class="" style="border:2px solid black; background-color: #f2d274; font-family: sans-serif" role="button">AFFICHER INSCRIPTION INDIVIDUELLE</a>
                                       </li>
                                    </ul>
                                </div>
                            </nav>
                          <!--   <div class="at-contactsocial">
                                <span class="at-contactnumber">
                                    <i class="icon-telephone114"></i>
                                    <em>+00221 33 837 80 09</em>
                                </span> 
                              <ul class="at-socialicons">
                                    <li class="at-facebook"><a href="https://www.facebook.com/badel"><i class="fa fa-facebook"></i></a></li>
                                    <li class="at-twitter"><a href="https://www.twitter.com/badel"><i class="fa fa-twitter"></i></a></li>
                                    <li class="at-instagram"><a href="https://www.youtube.com/badel"><i class="fa fa-youtube"></i></a></li>
                                </ul>
                             -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!--************************************
                                    Header End
                    *************************************-->

            <%if ("ind".equals(type)) {
                    /* R�cup�ration des donn�es de p1demandind */
                    //int compte = 1;
                    String remplir = " Remplir ";
                    String remplir2 = " Remplir ";
                    String remplir3 = " Remplir "; 
                    
                 //   String location1 = "inscriptionIndividuelle1";
                    String location2 = "inscriptionIndividuelle2";
                    String location3 = "inscriptionIndividuelle3";

                    String formIn1 = "";
                    String formIn2 = "";
                    String formIn3 = "";
                    String formIn4 = "";
                    String formIn5 = "";
                    String formIn6 = "";
                    String formIn7 = "";
                    String formIn8 = "";
                    String formIn9 = "";
                    String formIn10 = "";
                    String formIn11 = "";
                    String formIn12 = "";
                    String formIn13 = "";
                    String formIn14 = "";
                    String formIn15 = "";
                    String formIn16 = "";
                    String formIn17 = "";
                    String formIn18 = "";
                    String formIn19 = "";
                    String formIn20 = "";
                    String formIn21 = "";
                    String formIn22 = "";
                    String formIn23 = "";
                    String formIn24 = "";
                    String formIn25 = "";
                    String formIn26 = "";
                    String formIn27 = "";
                    String formIn28 = "";
                    String formIn29 = "";
                    String formIn30 = "";
                    String formIn31 = "";
                    String formIn32 = "";

                    try {

                        String sql1 = "SELECT * FROM `p1demandeurindividuel` WHERE `formulaire_id` LIKE '" + idform + "'";
                        // String idx = "0";
                        pst1 = con.prepareStatement(sql1);
                        ResultSet rs1 = pst1.executeQuery();

                        while (rs1.next()) {

                            formIn1 = rs1.getString(1);
                            formIn2 = rs1.getString(2);
                            formIn3 = rs1.getString(3);
                            formIn4 = rs1.getString(4);
                            formIn5 = rs1.getString(5);
                            formIn6 = rs1.getString(6);
                            formIn7 = rs1.getString(7);
                            formIn8 = rs1.getString(8);
                            formIn9 = rs1.getString(9);
                            formIn10 = rs1.getString(10);
                            formIn11 = rs1.getString(11);
                            formIn12 = rs1.getString(12);
                            formIn13 = rs1.getString(13);
                            formIn14 = rs1.getString(14);
                            formIn15 = rs1.getString(15);
                            formIn16 = rs1.getString(16);
                            formIn17 = rs1.getString(17);
                            formIn18 = rs1.getString(18);
                            formIn19 = rs1.getString(19);
                            formIn20 = rs1.getString(20);
                            formIn21 = rs1.getString(21);
                            formIn22 = rs1.getString(22);
                            formIn23 = rs1.getString(23);
                            formIn24 = rs1.getString(24);
                            formIn25 = rs1.getString(25);
                            formIn26 = rs1.getString(26);
                            formIn27 = rs1.getString(27);
                            formIn28 = rs1.getString(28);
                            formIn29 = rs1.getString(29);
                            formIn30 = rs1.getString(30);
                            formIn31 = rs1.getString(31);
                            formIn32 = rs1.getString(32);
                            remplir = " Modifier ";
                            //     location1 = "updateInd1";
                        }
                    } catch (SQLException ex) {
                        System.out.println("Erreur recup ind1 " + ex);
                    }

                    /* R�cup�ration des donn�es de p2demandind */
                    //int compte1 = 1;
                    String form2In1 = "";
                    String form2In2 = "";
                    String form2In3 = "";
                    String form2In4 = "";
                    String form2In5 = "";
                    String form2In6 = "";

                    try {

                        String sql1 = "SELECT * FROM `p2demandeurindividuel` WHERE `formulaire_id` LIKE '" + idform + "'";
                        // String idx = "0";
                        pst1 = con.prepareStatement(sql1);
                        ResultSet rs1 = pst1.executeQuery();

                        while (rs1.next()) {

                            form2In1 = rs1.getString(1);
                            form2In2 = rs1.getString(2);
                            form2In3 = rs1.getString(3);
                            form2In4 = rs1.getString(4);
                            form2In5 = rs1.getString(5);
                            form2In6 = rs1.getString(6);
                            remplir2 = " Modifier ";
                            location2 = "updateInd2";

                        }
                    } catch (SQLException ex) {
                        System.out.println("Erreur recup ind1 " + ex);
                    }

                    /* R�cup�ration des donn�es de p3demandind */
                    //int compte1 = 1;
                    String form3In1 = "";
                    String form3In2 = "";
                    String form3In3 = "";
                    String form3In4 = "";
                    String form3In5 = "";
                    String form3In6 = "";
                    String form3In7 = "";
                    String form3In8 = "";
                    String form3In9 = "";
                    String form3In10 = "";
                    String form3In11 = "";
                    String form3In12 = "";
                    String form3In13 = "";
                    String form3In14 = "";
                    String form3In15 = "";

                    try {

                        String sql1 = "SELECT * FROM `p3demandeurindividuel` WHERE `formulaire_id` LIKE '" + idform + "'";
                        // String idx = "0";
                        pst1 = con.prepareStatement(sql1);
                        ResultSet rs1 = pst1.executeQuery();

                        while (rs1.next()) {

                            form3In1 = rs1.getString(1);
                            form3In2 = rs1.getString(2);
                            form3In3 = rs1.getString(3);
                            form3In4 = rs1.getString(4);
                            form3In5 = rs1.getString(5);
                            form3In6 = rs1.getString(6);
                            form3In7 = rs1.getString(7);
                            form3In8 = rs1.getString(8);
                            form3In9 = rs1.getString(9);
                            form3In10 = rs1.getString(10);
                            form3In11 = rs1.getString(11);
                            form3In12 = rs1.getString(12);
                            form3In13 = rs1.getString(13);
                            form3In14 = rs1.getString(14);
                            form3In15 = rs1.getString(15);
                            remplir3 = " Modifier ";
                            location3 = "updateInd3";

                        }
                    } catch (SQLException ex) {
                        System.out.println("Erreur recup ind1 " + ex);
                    }
            %>  
            <main id="at-main" class="at-main at-haslayout">

                <div class="clearfix"></div>
                <section class="at-sectionspace at-haslayout">
                    <div class="container">
                        <h1 style="text-align: center;">Dossier de <strong><%=formIn4%>&nbsp;<%=formIn5%> </strong> <br />Id: <%=formIn3%></h1>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <hr>
                                    <div class="at-contactusvone">
                                        <h3 style="text-align: center;">Premi�re Partie</h3>
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Option</th>
                                                        <th>Inscrit_Par</th>
                                                        <th>Id_Formulaire</th>
                                                        <th>Prenom</th>
                                                        <th>Nom</th>
                                                        <th>T�l�phone_1</th>
                                                        <th>T�l�phone_2</th>
                                                        <th>Comm._de_Rattachement</th>
                                                        <th>Quart._de_Rattachement</th>
                                                        <th>Comm._Actuelle</th>
                                                        <th>Quart._Actuel</th>
                                                        <th>Sexe</th>
                                                        <th>Tranche_d'Age</th>
                                                        <th>Etude</th>
                                                        <th>Niveau_d'Etude</th>
                                                        <th>Format._Professionnelle</th>
                                                        <th>S�jour</th>
                                                        <th>Pays_S�journ�</th>
                                                        <th>Motif_S�jour</th>
                                                        <th>Exp�r._Professionnelle</th>
                                                        <th>Domaine_Exp�r._Professionnelle</th>
                                                        <th>Dur�e_Exp�r._Professionnelle</th>
                                                        <th>Statut_Exp�r._Professionnelle</th>
                                                        <th>R�gion_Exp�r._Professionnelle</th>
                                                        <th>D�part._Exp�r._Professionnelle</th> 
                                                        <th>Comm._Exp�r._Professionnelle</th>
                                                        <th>Quart._Exp�r._Professionnelle</th>
                                                        <th>Autre_Quart._Exp�r._Professionnelle</th>
                                                        <th>Ext�rieur</th>
                                                        <th>Situation_Professionnelle</th>
                                                        <th>Soutien_Imm�diat</th>
                                                        <th>Titre_Accompagnement</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value="<%=remplir%>" onclick="location.href = 'updateInd1.jsp?formulaire_id=<%=formIn3%>&id=<%=idx%>&form=p1ind'"/><input style="background-color: red; color: white" type="button" value="  Effacer " onclick="location.href ='delete.jsp?formulaire_id=<%=formIn3%>&id=<%=idx%>&table=p1demandeurindividuel'"/></td>
                                                                                                           
                                                        <td><%=Prenom%>&nbsp;<%=nom%></td>
                                                        <td><%=formIn3%></td>
                                                        <td><%=formIn4%></td>
                                                        <td><%=formIn5%></td>
                                                        <td><%=formIn6%></td>
                                                        <td><%=formIn7%></td>
                                                        <td><%=formIn8%></td>
                                                        <td><%=formIn9%></td>
                                                        <td><%=formIn10%></td>
                                                        <td><%=formIn11%></td>
                                                        <td><%=formIn12%></td>
                                                        <td><%=formIn13%></td>
                                                        <td><%=formIn14%></td>
                                                        <td><%=formIn15%></td>
                                                        <td><%=formIn16%></td>
                                                        <td><%=formIn17%></td>
                                                        <td><%=formIn18%></td>
                                                        <td><%=formIn19%></td>
                                                        <td><%=formIn20%></td>
                                                        <td><%=formIn21%></td>
                                                        <td><%=formIn22%></td>
                                                        <td><%=formIn23%></td>
                                                        <td><%=formIn24%></td>
                                                        <td><%=formIn25%></td>
                                                        <td><%=formIn26%></td>
                                                        <td><%=formIn27%></td>
                                                        <td><%=formIn28%></td>
                                                        <td><%=formIn29%></td>  
                                                        <td><%=formIn30%></td>  
                                                        <td><%=formIn31%></td>  
                                                        <td><%=formIn32%></td>   
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <hr>
                                    <div class="at-contactusvone">
                                        <h3 style="text-align: center;">Deuxi�me Partie</h3>
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Option</th>
                                                        <th>Id_Formulaire</th>
                                                        <th>Cat�gories</th>
                                                        <th>Sous-Cat�gories</th>
                                                        <th>Parcours</th>
                                                        <th>Marqueurs</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value="<%=remplir2%>" onclick="location.href = '<%=location2%>.jsp?formulaire_id=<%=formIn3%>&id=<%=idx%>&form=p2ind'"/></td>

                                                        <td><%=form2In2%></td>
                                                        <td><%=form2In3%></td>
                                                        <td><%=form2In4%></td>
                                                        <td><%=form2In5%></td>
                                                        <td><%=form2In6%></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <hr>
                                    <div class="at-contactusvone">
                                        <h3 style="text-align: center;">Troisi�me Partie</h3>
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Option</th>
                                                        <th>Id_Formulaire</th>
                                                        <th>R�gi_Commerce</th>
                                                        <th>N�_R�gi_Commerce</th>
                                                        <th>NINEA</th>
                                                        <th>N�_NINEA</th>
                                                        <th>R�f�rence_Professionnel</th>
                                                        <th>N�_R�ference_Professionnel</th>
                                                        <th>Compte_Bancaire</th>
                                                        <th>Nom_Banque_ou_SFD</th>
                                                        <th>N�_Compte_Banque_ou_SFD</th>
                                                        <th>Soutien_d'un_Partenaire</th>
                                                        <th>Ville_du_Partenaire</th>
                                                        <th>Pays_du_Partenaire</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value="<%=remplir3%>" onclick="location.href = '<%=location3%>.jsp?formulaire_id=<%=formIn3%>&id=<%=idx%>&form=p3ind'"/></td>
                                                        <td><%=form3In2%></td>
                                                        <td><%=form3In3%></td>
                                                        <td><%=form3In4%></td>
                                                        <td><%=form3In5%></td>
                                                        <td><%=form3In6%></td>
                                                        <td><%=form3In7%></td>
                                                        <td><%=form3In8%></td>
                                                        <td><%=form3In9%></td>
                                                        <td><%=form3In10%></td>
                                                        <td><%=form3In11%></td>
                                                        <td><%=form3In12%></td>
                                                        <td><%=form3In13%></td>
                                                        <td><%=form3In14%></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                </section>
            </main>    
            <%
            } else {

                /* R�cup�ration des donn�es de p1demandCol */
                //int compte = 1;
                String remplir = " Remplir ";
                String remplir2 = " Remplir ";
                String location2 = "inscriptionCollective2";

                String formCon1 = "";
                String formCon2 = "";
                String formCon3 = "";
                String formCon4 = "";
                String formCon5 = "";
                String formCon6 = "";
                String formCon7 = "";
                String formCon8 = "";
                String formCon9 = "";
                String formCon10 = "";
                String formCon11 = "";
                String formCon12 = "";
                String formCon13 = "";
                String formCon14 = "";
                String formCon15 = "";
                String formCon16 = "";
                String formCon17 = "";
                String formCon18 = "";
                String formCon19 = "";
                String formCon20 = "";
                String formCon21 = "";
                String formCon22 = "";
                String formCon23 = "";
                String formCon24 = "";
                String formCon25 = "";
                String formCon26 = "";
                String formCon27 = "";
                

                try {

                    String sql1 = "SELECT * FROM `p1demandeurcollectif` WHERE `formulaire_id` LIKE '" + idform + "' and supp = 0";
                    // String idx = "0";
                    pst1 = con.prepareStatement(sql1);
                    ResultSet rs1 = pst1.executeQuery();

                    while (rs1.next()) {

                        formCon1 = rs1.getString(1);
                        formCon2 = rs1.getString(2);
                        formCon3 = rs1.getString(3);
                        formCon4 = rs1.getString(4);
                        formCon5 = rs1.getString(5);
                        formCon6 = rs1.getString(6);
                        formCon7 = rs1.getString(7);
                        formCon8 = rs1.getString(8);
                        formCon9 = rs1.getString(9);
                        formCon10 = rs1.getString(10);
                        formCon11 = rs1.getString(11);
                        formCon12 = rs1.getString(12);
                        formCon13 = rs1.getString(13);
                        formCon14 = rs1.getString(14);
                        formCon15 = rs1.getString(15);
                        formCon16 = rs1.getString(16);
                        formCon17 = rs1.getString(17);
                        formCon18 = rs1.getString(18);
                        formCon19 = rs1.getString(19);
                        formCon20 = rs1.getString(20);
                        formCon21 = rs1.getString(21);
                        formCon22 = rs1.getString(22);
                        formCon23 = rs1.getString(23);
                        formCon24 = rs1.getString(24);
                        formCon25 = rs1.getString(25);
                        formCon26 = rs1.getString(26);
                        formCon27 = rs1.getString(27);
                        remplir = " MODIFIER ";

                    }
                } catch (SQLException ex) {
                    System.out.println("Erreur recup col1 " + ex);
                }

                /* R�cup�ration des donn�es de p2demandCol*/
                //int compte1 = 1;
                String form2Con1 = "";
                String form2Con2 = "";
                String form2Con3 = "";
                String form2Con4 = "";
                String form2Con5 = "";
                String form2Con6 = "";
                String form2Con7 = "";
                String form2Con8 = "";
                String form2Con9 = "";
                String form2Con10 = "";
                String form2Con11 = "";
                String form2Con12 = "";
                String form2Con13 = "";
                String form2Con14 = "";
                String form2Con15 = "";
                String form2Con16 = "";
                String form2Con17 = "";
                String form2Con18 = "";
                String form2Con19 = "";
                String form2Con20 = "";
                String form2Con21 = "";
                String form2Con22 = "";
                String form2Con23 = "";
                String form2Con24 = "";
                String form2Con25 = "";
                String form2Con26 = "";
                String form2Con27 = "";
                String form2Con28 = "";
                String form2Con29 = "";
                String form2Con30 = "";
                String form2Con31 = "";
                String form2Con32 = "";
                String form2Con33 = "";
                

                try {

                    String sql1 = "SELECT * FROM `p2demandeurcollectif` WHERE `formulaire_id` LIKE '" + idform + "'";
                    // String idx = "0";
                    pst1 = con.prepareStatement(sql1);
                    ResultSet rs1 = pst1.executeQuery();

                    System.out.println("hey1");
                    while (rs1.next()) {

                        form2Con1 = rs1.getString(1);
                        form2Con2 = rs1.getString(2);
                        form2Con3 = rs1.getString(3);
                        form2Con4 = rs1.getString(4);
                        form2Con5 = rs1.getString(5);
                        form2Con6 = rs1.getString(6);
                        form2Con7 = rs1.getString(7);
                        form2Con8 = rs1.getString(8);
                        form2Con9 = rs1.getString(9);
                        form2Con10 = rs1.getString(10);
                        form2Con11 = rs1.getString(11);
                        form2Con12 = rs1.getString(12);
                        form2Con13 = rs1.getString(13);
                        form2Con14 = rs1.getString(14);
                        form2Con15 = rs1.getString(15);
                        form2Con16 = rs1.getString(16);
                        form2Con17 = rs1.getString(17);
                        form2Con18 = rs1.getString(18);
                        form2Con19 = rs1.getString(19);
                        form2Con20 = rs1.getString(20);
                        form2Con21 = rs1.getString(21);
                        form2Con22 = rs1.getString(22);
                        form2Con23 = rs1.getString(23);
                        form2Con24 = rs1.getString(24);
                        form2Con25 = rs1.getString(25);
                        form2Con26 = rs1.getString(26);
                        form2Con27 = rs1.getString(27);
                        form2Con28 = rs1.getString(28);
                        form2Con29 = rs1.getString(29);
                        form2Con30 = rs1.getString(30);
                        form2Con31 = rs1.getString(31);
                        form2Con32 = rs1.getString(32);
                        form2Con33 = rs1.getString(33);
                        remplir2 = " MODIFIER ";
                        location2 = "updateCol2";

                        System.out.println("hey2");
                    }
                } catch (SQLException ex) {
                    System.out.println("Erreur recup col2 " + ex);
                }

            %>  
            <main id="at-main" class="at-main at-haslayout">

                <div class="clearfix"></div>
                <section class="at-sectionspace at-haslayout">
                    <div class="container">
                        <h1 style="text-align: center;">Dossier du Collectif :<Strong> &nbsp;<%=formCon11%></Strong>  <br /> Id:<%=formCon2%></h1>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <hr>
                                    <div class="at-contactusvone">
                                        <h3 style="text-align: center;">Premi�re Partie</h3>
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Option</th>
                                                     <!--   <th>Inscrit_Par</th>   -->
                                                        <th>id Formulaire</th>
                                                        <th>Pr�nom_Repr�sentant</th>
                                                        <th>Nom_Repr�sentant</th>
                                                        <th>Sexe_R�pr�sentant</th>
                                                        <th>Adresse_Repr�sentant</th>
                                                        <th>Contact1_Repr�sentant</th>
                                                        <th>Contact2_Repr�sentant</th>
                                                        <th>Titre</th>
                                                        <th>Nature_Juridique</th>
                                                        <th>D�nomination</th>
                                                        <th>Reconn._Juridique</th>
                                                        <th>Lieu_Collectif</th>
                                                        <th>Pays_Ext�rieur</th>
                                                        <th>R�gion_Ext�rieure</th>
                                                        <th>D�partement_Ext�rieur</th>
                                                        <th>Commune_Ext�rieure</th>
                                                        <th>Quart._Village_Ext�rieur</th>
                                                        <th>R�gion_Int�rieure</th>
                                                        <th>D�partement_Int�rieur</th>
                                                        <th>Commune_Int�rieure</th>
                                                        <th>Quart._Village_Int�rieur</th>                                                        
                                                        <th>Date_Creation</th>
                                                        <th>Tot._Membre</th>
                                                        <th>Tot._homme</th>
                                                        <th>Tot._femme</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value="<%=remplir%>" onclick="location.href = 'updateCol1.jsp?formulaire_id=<%=formCon2%>&id=<%=idx%>&form=p1col'"/><input style="background-color: red; color: white" type="button" value="SUPPRIMER" onclick="location.href ='delete.jsp?formulaire_id=<%=formCon2%>&id=<%=idx%>&table=p1demandeurcollectif'"/></td>
                                                       
                                         <!--     <td><%=Prenom%>&nbsp;<%=nom%></td> -->
                                                        <td><%=formCon2%></td>
                                                        <td><%=formCon3%></td>
                                                        <td><%=formCon4%></td>
                                                        <td><%=formCon5%></td>
                                                        <td><%=formCon6%></td>
                                                        <td><%=formCon7%></td>
                                                        <td><%=formCon8%></td>
                                                        <td><%=formCon9%></td>
                                                        <td><%=formCon10%></td>
                                                        <td><%=formCon11%></td>
                                                        <td><%=formCon12%></td>
                                                        <td><%=formCon13%></td>
                                                        <td><%=formCon14%></td>
                                                        <td><%=formCon15%></td>
                                                        <td><%=formCon16%></td>
                                                        <td><%=formCon17%></td>
                                                        <td><%=formCon18%></td>
                                                        <td><%=formCon19%></td>
                                                        <td><%=formCon20%></td>
                                                        <td><%=formCon21%></td>
                                                        <td><%=formCon22%></td>
                                                        <td><%=formCon23%></td>
                                                        <td><%=formCon24%></td>
                                                        <td><%=formCon25%></td>
                                                        <td><%=formCon26%></td>
                                                        
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <hr>
                                    <div class="at-contactusvone">
                                        <h3 style="text-align: center;">Deuxi�me Partie</h3>
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Option</th>
                                                        <th>id_Formulaire</th>
                                                        <th>Activit�s_ou_Equipements</th>
                                                        <th>R�gion</th>
                                                        <th>D�partement</th>
                                                        <th>Commune</th>
                                                        <th>Quartier_Village</th>
                                                        <th>Autres_Activit�s</th>
                                                        <th>Activit�s_Secondaires</th>
                                                        <th>Lieux_Secondaires</th>
                                                        <th>Activit�_Economique_Primaire</th>
                                                        <th>Activit�_Economique_Secondaire</th>
                                                        <th>Activit�s_Equip_Autre_Pays</th>
                                                        <th>Activit�_Economique_Autre_Pays</th>
                                                        <th>Activit�s_Equip_Autre_Pays</th>
                                                        <th>Montant_Capital_Social</th>
                                                        <th>Nombre_d'Employ�s_Permanants</th>
                                                        <th>Nombre_d'Employ�s_Temporaires</th>
                                                        <th>Montant_Epargne_Mobilis�</th>
                                                        <th>Montant_Endettement</th>
                                                        <th>Montant_Subvention_Re�u</th>
                                                        <th>Fonctionnalit�_Organes</th>
                                                        <th>Mode_Prise_D�cision</th>
                                                        <th>Disponibilt�_Charte</th>
                                                        <th>Disponibilt�_Plan_D�veloppement</th>
                                                        <th>Disponibilt�_Manuel_Proc�dure</th>
                                                        <th>Partenaire_Principal_Technique</th>
                                                        <th>Partenaire_Principal_Financier</th>
                                                        <th>Appartenance_R�seau</th>
                                                        <th>Nature_R�seau</th>
                                                        <th>Localit�_R�seau</th>
                                                        <th>D�partement_R�seau</th>
                                                        <th>Internation_National</th>
                                                    </tr>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value="<%=remplir2%>" onclick="location.href = '<%=location2%>.jsp?formulaire_id=<%=formCon2%>&id=<%=idx%>&form=p2col'"/></td>

                                                       <td><%=form2Con2%></td> 
                                                        <td><%=form2Con3%></td>
                                                        <td><%=form2Con4%></td>
                                                        <td><%=form2Con5%></td>
                                                        <td><%=form2Con6%></td>
                                                        <td><%=form2Con7%></td>
                                                        <td><%=form2Con8%></td>
                                                        <td><%=form2Con9%></td>
                                                        <td><%=form2Con10%></td>
                                                        <td><%=form2Con11%></td>
                                                        <td><%=form2Con12%></td>
                                                        <td><%=form2Con13%></td>
                                                        <td><%=form2Con14%></td>
                                                        <td><%=form2Con15%></td>
                                                        <td><%=form2Con16%></td>
                                                        <td><%=form2Con17%></td>
                                                        <td><%=form2Con18%></td>
                                                        <td><%=form2Con19%></td>
                                                        <td><%=form2Con20%></td>
                                                        <td><%=form2Con21%></td>
                                                        <td><%=form2Con22%></td>
                                                        <td><%=form2Con23%></td>
                                                        <td><%=form2Con24%></td>
                                                        <td><%=form2Con25%></td>
                                                        <td><%=form2Con26%></td>
                                                        <td><%=form2Con27%></td>
                                                        <td><%=form2Con28%></td>
                                                        <td><%=form2Con29%></td>
                                                        <td><%=form2Con30%></td>
                                                        <td><%=form2Con31%></td>
                                                        <td><%=form2Con32%></td>
                                                        <td><%=form2Con33%></td>
                                                       
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                </section>
            </main>    
            <%
                }
            %>            
            <form  action="Principal.jsp" method="post">
                <input type="hidden" value="<%=id%>" name="id">  
                <center><button style="width: 320px; height: 70px; border: 2px solid red; background-color: #09b83e" type="submit" class="at-btn" >RETOURNER MENU PRINCIPAL</button></center>
            </form> 
            <br/>                        
            <!--************************************
                                    Footer Start
                    *************************************-->
            <footer id="at-footer" class="at-footer at-haslayout">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                          <!--  <div class="at-emailsubscribearea">
                                <p>Recevez nos derni�res informations</p>
                                <form class="at-formtheme at-formnewsletter">
                                    <fieldset>
                                        <input type="email" name="email" class="form-control" placeholder="Votre adresse e-mail">
                                        <button class="at-btn" type="submit">Souscrire</button>
                                    </fieldset>
                                </form>
                            </div> 
                          -->
                           <!--    <div class="at-threecolumns">
                                <div class="at-fcolumn">
                                    <div class="at-widget at-widgettext">
                                        <strong class="at-logo"><a href="javascript:void(0);"><img src="images/logof.png" alt="image description"></a></strong>
                                          <div class="at-description">
                                                <p>Lorem ipsum dolor sit amet, consectetur adi pisi cing elit, sed do eiusmod tempor Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, the consectetur.</p>
                                            </div> 
                                        <ul class="at-socialicons">
                                            <li class="at-facebook"><a href="www.facebook.com/taataan"><i class="fa fa-facebook"></i></a></li>
                                            <li class="at-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li class="at-instagram"><a href="www.youtube.com/taataan"><i class="fa fa-youtube"></i></a></li>
                                        </ul>
                                       
                                    </div>
                                </div>
                                <div class="at-fcolumn">
                                    <div class="at-widget at-widgetusefullinks">
                                        <div class="at-fwidgettitle">
                                            <h3>Liens Utiles</h3>
                                        </div>
                                        <div class="at-widgetcontent">
                                            <ul>
                                                <li><a href="https://www.adel-invest.com">Adel-invest</a></li>
                                                <li><a href="https://www.taataan.sn">Taataan</a></li>
                                                <li>
                                                    <p>Email: contact@taataan.sn</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div> 
                              <div class="at-fcolumn">
                                    <div class="at-widget">
                                        <div class="at-fwidgettitle">
                                            <h3>Recent News</h3>
                                        </div>
                                        <div class="at-widgetcontent">
                                          <ul>
                                                <li>
                                                       <p>Product Design &amp; Branding Innovative Brand Design Concepts</p> 
                                                    <time datetime="2018-01-12">January 28, 2018</time>
                                                </li>
                                                <li>
                                                      <p>Product Design &amp; Branding Innovative Brand Design Concepts</p> 
                                                    <time datetime="2020-24-11">Novembre 24, 2020</time>
                                                </li>
                                            </ul> 
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                           <div class="at-copyright">
                                <p>Adresse: ZAC MBAO villa N�3 4i&egrave;me Etage Cit&eacute; Socidak 1 en face Brioche Dor&eacute;e, Rufisque Ouvert de 09H &agrave; 17H</p>
                                <p>Copyright @ 2020. <p>Email: bara.wade@taataan.sn</p><a href="https://www.taataan.sn">ASADIC TAATAAN</a> All rights reserved.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!--************************************
                                    Footer End
                    *************************************-->
            <%
                }
            } catch (SQLException ex) {%>

            <main id="at-main" class="at-main at-haslayout">

                <div class="clearfix"></div>
                <section class="at-sectionspace at-haslayout">
                    <div class="container">
                        <h1 style="text-align: center;">Erreur id Conect1</h1>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <div class="at-contactusvone">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <%
                }
                 con.close();
                 System.out.println("Connection Closed");
            %>
        </div>
        <!--************************************
                            Wrapper End
            *************************************-->
        <script src="js/vendor/jquery-library.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcvAXp35fi4q7HXm7vcG9JMtzQbMzjRe8"></script>
        <script src="js/vendor/jquery-migrate.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/Chart.bundle.min.js"></script>
        <script src="js/isotope.pkgd.js"></script>
        <script src="js/prettyPhoto.js"></script>
        <script src="js/jquery.vide.js"></script>
        <script src="js/pogoslider.js"></script>
        <script src="js/countTo.js"></script>
        <script src="js/appear.js"></script>
        <script src="js/gmap3.js"></script>
        <script src="js/function.js"></script>
    </body>
</html>
