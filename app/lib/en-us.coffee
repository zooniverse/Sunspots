PROJECT_NAME = 'Sunspotters'

module.exports =
  home:
    welcome: 'Welcome To'
    project: "#{ PROJECT_NAME }"
    tagline: "We need you help to organize images of sunspots based on their complexity!"
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
  
  sciencePage:
    text: "Summary of studies comparing sunspot group properties to flaring...studies of sunspot group complexity..."
  
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
        gallagher: "Peter is an associate professor at Trinity College Dublin, Ireland, where he runs a research group in solar physics and teaches undergraduate physics."
    zooniverse:
      header: "The Zooniverse Team"
      tagline: "The people behind the project"
      bios:
        lintott: "Our Illustrious Leader"
        whyte: "Our Director"
        parrish: "The developer"
        singel: "The designer"
        borden: "The educator"
  
  profile:
    signInForProfile: "Sign In"
    noAccount: "No Account?"
    signUp: "Sign Up"
    signIn: "Sign In"
    username: "Username"
    password: "Password"
  
  stats:
    rankings: "Rankings"
    total: "Images"
    pass: "Pass"
    users: "Volunteers"
