import GUI
setscreen ("graphics: 900; 800;")
var winID : int := Window.Open ("position:300; 200, graphics:900; 600")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DECLARATION/INIIALIZATION START %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var ExploreButton, QuitButton, HomeButton, JobDescriptionsButton, JobTitlesButton, JobDutiesButton, EmployersButton, WagesButton, MarketButton, InstitutionsButton, UWaterlooButton, UBCButton, GeorgeBrownCButton, ReferencesButton, PageBackground, fileNumber : int
const TITLESTARTY := 65
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DECLARATION/INIIALIZATION END --/-- FUNCTIONS/PROCEDURES START %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
procedure MakeTitle (Text : string, StartX, StartY : int, font : string, FontColour : int)
    Font.Draw (Text, StartX, StartY, Font.New (font), FontColour)
end MakeTitle
procedure CreatePage (BackgroundImageDir, FileDir, TitleFontFaceSize, Title, TextFontFaceSize : string, TitleFontColour, TextFontColour, StartText, LineSpacing, YAdjust : int, drawBackground : boolean, TitleStartX, TitleStartY : int)
    if drawBackground = true then % Page Layout
	cls GUI.Hide (ExploreButton) GUI.Hide (UWaterlooButton) GUI.Hide (UBCButton) GUI.Hide (GeorgeBrownCButton)
	PageBackground := Pic.FileNew (BackgroundImageDir)
	Pic.Draw (PageBackground, 0, 0, picMerge)
    end if
    var line : string % File Manipulation
    var currentLine : int := 0
    open : fileNumber, FileDir, get
    MakeTitle (Title, TitleStartX, TitleStartY, TitleFontFaceSize, TitleFontColour)
    if fileNumber > 0 then
	loop
	    exit when eof (fileNumber)
	    get : fileNumber, line : *
	    currentLine += 1
	    Font.Draw (line, StartText, maxy - TITLESTARTY - LineSpacing * currentLine - YAdjust, Font.New (TextFontFaceSize), TextFontColour)
	end loop
    end if
    close : fileNumber
    GUI.Refresh
end CreatePage
procedure HomePage % Home
    GUI.Show (ExploreButton) GUI.Hide (UWaterlooButton) GUI.Hide (UBCButton) GUI.Hide (GeorgeBrownCButton) cls
    PageBackground := Pic.FileNew ("Pictures/HomePageBackground.jpg")
    Pic.Draw (PageBackground, 0, 0, picMerge)
    Font.Draw ("Software engineers and designers", round (maxx / 2 - Font.Width ("Software engineers and designers", Font.New ("Copperplate Gothic Light:30")) / 2), maxy div 2 + 20, Font.New ("Copperplate Gothic Light:30"), white)
    GUI.Refresh
end HomePage
procedure JobDescriptionsPage % Job Descriptions
    CreatePage ("Pictures/JobDescriptionsBackground.jpg", "Texts/JobDescriptions.txt", "Copperplate Gothic Light:25", "Job Descriptions", "Palatino Linotype:15", 0, 0, 50, 50, 0, true, round (maxx / 2 - Font.Width ("Job Descriptions", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
end JobDescriptionsPage
procedure JobTitlesPage % Job Titles
    CreatePage ("Pictures/JobTitlesBackground.jpg", "Texts/JobTitles.txt", "Copperplate Gothic Light:25", "Job Titles", "Palatino Linotype:15", 0, 0, (maxx div 2) div 2 + 40, 50, 0, true, round (maxx / 2 - Font.Width ("Job Titles", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
end JobTitlesPage
procedure JobDutiesPage % Job Duties
    CreatePage ("Pictures/JobDutiesBackground.jpg", "Texts/JobDuties.txt", "Copperplate Gothic Light:25", "Job Duties", "Palatino Linotype:15", 255, 255, 50, 30, 0, true, round (maxx / 2 - Font.Width ("Job Duties", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
end JobDutiesPage
procedure EmployersPage % Employers
    CreatePage ("Pictures/TypesOfEmployersBackground.jpg", "Texts/Employers.txt", "Copperplate Gothic Light:25", "", "Palatino Linotype:13", 0, 0, 50, 17, 40, true, round (maxx / 2 - Font.Width ("Employers", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
    MakeTitle ("Employers", round (maxx / 2 - Font.Width ("Employers", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY, "Copperplate Gothic Light:25", 0)
    MakeTitle ("Type of Employers               Example of Employers               Average Base Salary", round (maxx / 2 - Font.Width ("Type of Employers               Example of Employers               Average Base Salary", Font.New ("Palatino Linotype Bold:13")) div 2), maxy - 100, "Palatino Linotype Bold:13", 0)
end EmployersPage
procedure WagesPage % Wages
    CreatePage ("Pictures/Salary.jpg", "Texts/Wages.txt", "Copperplate Gothic Light:25", "Wages", "Palatino Linotype:15", 255, 255, 20, 30, -5, true, round (maxx / 2 - Font.Width ("Wages", Font.New ("Copperplate Gothic Light:25")) / 2), maxy - TITLESTARTY)
end WagesPage
procedure MarketPage % Market
    CreatePage ("Pictures/MarketBackground.jpg", "Texts/MarketOutlook.txt", "Copperplate Gothic Light:20", "Market Outlook", "Palatino Linotype:15", 0, 0, 10, 25, 10, true, ((maxx div 2) div 2) - Font.Width ("Market Outlook", Font.New ("Copperplate Gothic Light:20")) div 2, maxy - TITLESTARTY)
    CreatePage ("Pictures/MarketBackground.jpg", "Texts/MarketEducationJobRequirements.txt", "Copperplate Gothic Light:16", "Market Education & Job Requirements", "Palatino Linotype:15", 0, 0, maxx div 2 + 5, 22, 5, false, maxx div 2 + maxx div 2 div 2 - Font.Width ("Market Education & Job Requirements", Font.New ("Copperplate Gothic Light:16")) div 2, maxy - TITLESTARTY)
end MarketPage
procedure UWaterlooPage % University of Waterloo
    CreatePage ("Pictures/UWaterlooBackground.jpg", "Texts/UWaterloo.txt", "Copperplate Gothic Light:20", "University of Waterloo, Waterloo, ON, Canada", "Palatino Linotype:13", 0, 0, 200, 16, 10, true, round (maxx / 2 - Font.Width ("University of Waterloo, Waterloo, ON, Canada", Font.New ("Copperplate Gothic Light:20")) div 2), maxy - TITLESTARTY)
end UWaterlooPage
procedure UBCPage % University of British Columbia
    CreatePage ("Pictures/UBCBackground.jpg", "Texts/UBC.txt", "Copperplate Gothic Light:20", "The University of British Columbia, Vancouver, BC, Canada", "Palatino Linotype:13", 0, 0, 100, 15, 5, true, round (maxx / 2 - Font.Width ("The University of British Columbia, Vancouver, BC, Canada", Font.New ("Copperplate Gothic Light:20")) div 2), maxy - TITLESTARTY)
end UBCPage
procedure GeorgeBrownCPage % George Brown College
    CreatePage ("Pictures/GeorgeBrownCBackground.jpg", "Texts/GeorgeBrownC.txt", "Copperplate Gothic Light:20", "George Brown College, Toronto, ON, Canada", "Palatino Linotype:13", 0, 0, 150, 19, 8, true, round (maxx / 2 - Font.Width ("George Brown College, Toronto, ON, Canada", Font.New ("Copperplate Gothic Light:20")) div 2), maxy - TITLESTARTY)
end GeorgeBrownCPage
procedure InstitutionsPage % Institutions
    CreatePage ("Pictures/InstitutionsBackground.jpg", "Texts/Institutions.txt", "Copperplate Gothic Light:25", "Institutions", "Palatino Linotype:15", 255, 0, 0, 0, 0, true, round (maxx / 2 - Font.Width ("Institutions", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
    GUI.Show (UWaterlooButton)
    GUI.Show (UBCButton)
    GUI.Show (GeorgeBrownCButton)
end InstitutionsPage
procedure ReferencesPage % References
    CreatePage ("Pictures/ReferencesBackground.jpg", "Texts/References.txt", "Copperplate Gothic Light:25", "References", "Times New Roman:11", 0, 0, 50, 14, 5, true, round (maxx / 2 - Font.Width ("References", Font.New ("Copperplate Gothic Light:25")) div 2), maxy - TITLESTARTY)
end ReferencesPage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PROCEDURES END --/-- MAIN CODE START%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ExploreButton := GUI.CreateButtonFull ((maxx div 2) - (100 div 2), (maxy div 2) - (50 div 2) - 20, 100, "Explore", JobDescriptionsPage, 50, ' ', false)
HomeButton := GUI.CreateButtonFull (1, maxy - 25, 0, "Home", HomePage, 0, ' ', false)
JobDescriptionsButton := GUI.CreateButton (62, maxy - 25, 0, "Job Descriptions", JobDescriptionsPage)
JobTitlesButton := GUI.CreateButton (179, maxy - 25, 0, "Job Titles", JobTitlesPage)
JobDutiesButton := GUI.CreateButton (261, maxy - 25, 0, "Job Duties", JobDutiesPage)
EmployersButton := GUI.CreateButton (347, maxy - 25, 0, "Employers", EmployersPage)
WagesButton := GUI.CreateButton (432, maxy - 25, 0, "Wages", WagesPage)
MarketButton := GUI.CreateButton (496, maxy - 25, 0, "Market", MarketPage)
InstitutionsButton := GUI.CreateButton (565, maxy - 25, 0, "Institutions", InstitutionsPage)
UWaterlooButton := GUI.CreateButtonFull (450, 50, 100, "University of Waterloo", UWaterlooPage, 50, ' ', false)
UBCButton := GUI.CreateButtonFull (174, 68, 100, "University of British Columbia", UBCPage, 50, ' ', false)
GeorgeBrownCButton := GUI.CreateButtonFull (612, 0, 0, "George Brown College", GeorgeBrownCPage, 50, ' ', false)
ReferencesButton := GUI.CreateButton (656, maxy - 25, 0, "References", ReferencesPage)
HomePage
QuitButton := GUI.CreateButtonFull (maxx - 100, maxy - 25, 100, "Quit", GUI.Quit, 0, chr (27), true)
GUI.Refresh
loop
    Font.Draw ("Vincent Zhang", maxx - 89, 4, Font.New ("Times New Roman:12"), white)
    exit when GUI.ProcessEvent
end loop
Window.Close (winID)
