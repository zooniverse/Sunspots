PROJECT_NAME = 'Sunspotters'

module.exports =
  home:
    welcome: 'Welcome To'
    project: "#{ PROJECT_NAME }"
    tagline: "We need your help to organize sunspot images in order of complexity to better understand and predict how the Sun's magnetic activity affects us on Earth."
    callToAction: "Start Ranking"
    prompt: "What are sunspots?"
  
  navigation:
    classify: "Classify"
    science: "Science"
    education: "Education"
    team: "Team"
    discuss: "Discuss"
    blog: "Blog"
    profile: "Profile"
  
  classifyPage:
    question: "Which is more complex?"
    explanationPrompt: "What do we mean by complex?"
    invert: "Invert"
    chooseSubject: "Choose"
    explanation:
      description: "When comparing two sunspot groups, complexity may be determined by size, shape, and combinations of white and black colors. Trust your gut, it's probably right. Lots of people are looking at each image set, so just take your best guess."
      examplePrompt: "Here are a few examples..."
      moreComplex: "More Complex"
  
  sciencePage:
    sunspots:
      title: "What is a sunspot?"
      
      intro:
        p1: "Sunspots are the most obvious manifestation of the Sun as a magnetic dynamo."
        p2: "They are the locations where strong bundles of magnetic fields cross the surface of the Sun from the solar interior to the solar atmosphere or vice versa.  This surface is called the photosphere."
        p3: "The photosphere appears like the surface of a boiling pot.  As hot gas from below bubbles up to the surface, sunspots appear as dark spots when viewed in visible light because they are cooler than their surroundings.  This is because their strong magnetic fields prevent the boiling gas from replenishing the heat that is radiated away from the sunspot."
        p4: "Sunspots usually appear as bipolar, groups of two or more sunspots, with magnetic fields passing out of the Sun through one portion of the group and back into the other portion."
      
      sizeCaption:
        text: "Sunspots vary in size and tend to range between 1.500 - 50,000 km, making some larger than Earth"
        credit1: "Observed with the Swedish 1-m Solar Telescope (SST)"
        credit2: "The SST is operated on the island of La Palma by the Institute for Solar Physics in the Spanish Observatorio del Roque de los Muchachos of the Instituto de Astrofísica de Canarias"
        credit3: "Observations: Göran Scharmer and Kai Langhans, ISP"
        credit4: "Image processing: Mats Löfdahl, ISP"
      
      structure:
        p1: "Individual sunspots are composed of at least one dark central umbra, surrounded by a brighter penumbra, which are characterised by a filamentary structure."
        p2: "Umbral magnetic fields are mostly vertical, emanating outward from the solar surface."
        p3: "Penumbral magnetic fields, on the other hand are stretched and travel more horizontally outward across the solar surface before turning upward, away from the surface."
      
      structureCaption:
        text: "Image of a sunspot including its umbra and penumbra"
        credit1: "Image courtesy of SOHO/MDI consortium"
        credit2: "SOHO is a project of international cooperation between ESA and NASA"
      
      magnetic:
        p1: "The Sun generates these magnetic structures that cause a spectrum of effects that we observe on Earth as space weather."
        p2: "Sunspots are just the tip of the iceberg to an incredibly complex magnetic field generator"
      
      fieldCaption:
        text: "In this 3D model of a sunspot's magnetic field structure the field lines are represented in brown"
        credit1: "The field lines in the center (umbra) of a sunspot are vertical to the solar surface and those in the outer umbra are more horizontal"
        credit2: "John H. Thomas, Nigel O. Weiss, Steven M. Tobias and Nicholas H. Brummell"
        credit3: "Nature 420, 390-393 (28 November 2002) doi:10.1038/nature01174"
      
      magnetCaption:
        text: "Sunspot magnetic fields reach into the solar corona, shown by hot plasma which follows the magnetic field lines"
        credit1: "These field lines are similar to those from a magnet with a North and South magnetic pole"
        credit2: "Image courtesy of Windows to the Universe"
  
  educationPage:
    classroomActivities:
      header: "Classroom Activities"
      classifySunspots: """
        Have students classify sunspot group images using the Hale scheme and measure the total area of sunspots in each group by hand (using a regular grid). Then, using knowledge of which region produced the largest flare, a plot of largest flare versus sunspot area is made, with the hale class indicated by a symbol. This recreates work by Sammis et al. (2000).
        """
    galleryActivities:
      header: "Science Gallery Activities"
      recreation: """
        Recreating the sunspotters classification activity using printed pairs of images. Could show groups of students one pair at a time and have them choose A or B, or, could give the groups a stack of individual images and have them put them in order on a table from least to most complex, compact, total area. Then tell them which images were responsible for a flare, and have them make a graph of complexity versus area, and plot the ones that flared in red and the ones that did not flare in gray.
        """
      tracing: """
        Tracing visible/magnetic/EUV sunspot group images on transparencies, to determine if people agree on a way to group them. Shows how it is easy to group in visible, less easy in magnetic, difficult in EUV. Explain importance of deciding how to determine what is a single sunspot group. The definition of a detection has a large role in determining the distributions of sunspot group properties you see in the end. These distributions are used to study the physical characteristics of sunspot formation, evolution, decay, and for flare forecasting.
        """
  
  teamPage:
    science:
      header: "The Sunspotters Team"
      tagline: "The scientists behind the science"
      bios:
        higgins: "Paul has stoked his passion for expanding the interface between research and public outreach; first, as a developer of UniverseAdventure.org, then by working on SolarMontitor.org, and now by leading the SunSpotters science team."
        gallagher: "Peter is an associate professor at Trinity College Dublin, Ireland, where he runs a research group in solar physics and teaches undergraduate physics. He spends his time trying to understand how the Sun works and how it can affect the Earth."
        perez_suarez: "David is a post-doc at the Space Weather Team in the South African National Space Agency (SANSA), working as the Solar Physicist of the team.  Before South Africa David has been in Finland, Ireland, Northern Ireland, and Spain where he was born and did his physics degree."
        o_callaghan: "David has a B.A. and Ph.D. in computer science from Trinity College Dublin. David works as a senior software engineer with SilverCloud Health, developing and running an online platform for supporting mental health and well-being."
        roche: "Joseph studied Physics and Astrophysics at Trinity College before completing his PhD in 2012 as part of the Astrophysics Research Group.He is now Research Projects Coordinator for Science Gallery Dublin where his role is to find new opportunities for research and collaboration."
        o_neill: "Arlene has a degree in PhD Physics. She is now a STEM communication and outreach officer at AMBER, Trinity College Dublin (TCD). She is passionate about public engagement and is involved in a range of scientific outreach projects."
        ryan: "Dan completed a PhD at Trinity in solar physics as part of the Astrophysics Research Group. He has been leading the SunSpotters school outreach programme around Ireland and has just taken up a new posting at the Royal Observatory of Belgium in Brussels."
        bloomfield: "Shaun is a Senior Researcher in solar physics and space weather at Trinity College Dublin, Ireland. Shaun has worked on several spacecraft that observe the Sun, including the upcoming European Space Agency Solar Orbiter satellite mission."
        murray: "Sophie has been fascinated with space since she was a child. It was a natural step for her to complete a PhD in Solar Physics with the Astrophysics Research Group at Trinity College Dublin. Since 2013 Sophie has worked as a Space Weather Research Scientist at the Met Office UK."
        slater: ""
        leka: "KD is a Senior Research Scientist at NorthWest Research Associates, in Boulder, Colorado, USA. She studies the magnetic fields on the Sun and is interested in developing methods to forecast solar flares."
        barnes: ""
    zooniverse:
      header: "The Zooniverse Team"
      tagline: "The people behind the project"
      bios:
        borden: "With a background in museum education, Kelly joined the Zooniverse in 2011 to bring an educator's perspective and spread the word amongst teachers and students. She's fond of several C's: chocolate, cats, coffee, and more chocolate."
        lintott: "Astronomer and founder of both Galaxy Zoo and the Zooniverse that grew from it, Chris is interested in how galaxies form and evolve, how citizen science can change the world, and whether the Chicago Fire can get their act together."
        parrish: "Michael builds the Zooniverse infrastructure and the occasional project. Aside from web development; new technologies, science, a collection of hobbies tends to occupy his attention."
        singel: "Heath is the UX/UI Designer for projects at the Zooniverse where he works to craft thoughtful and engaging user experiences. Apart from design Heath also enjoys illustration, a good sci-fi or fantasy novel, and trips back to Michigan."
        snyder: "Chris Snyder began working on the Zooniverse team in fall 2012 as a web developer. In July 2013, he became the technical project manager. He received a degree in computer science from the University of Dayton."
        whyte: "As a former high school teacher and educator, with a PhD in galaxy classification, joining the Zooniverse as an educator was a natural fit for Laura. She's working to support teachers to use Zooniverse citizen science projects in the classroom."
  
  profile:
    signInForProfile: "Sign In"
    noAccount: "No Account?"
    signUp: "Sign Up"
    signIn: "Sign In"
    username: "Username"
    password: "Password"
    recents: 'Recents'
    favorites: 'Favorites'
    recentImages: 'Recent Images'
    favoriteImages: 'Favorite Images'
    pages: 'Page {x} of {y}'
    next: 'Next'
    previous: 'Previous'
  
  stats:
    rankings: "Rankings"
    total: "Images"
    pass: "Pass"
    users: "Volunteers"
