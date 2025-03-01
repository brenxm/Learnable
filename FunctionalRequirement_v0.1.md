 # Functional Requirement
- **Title**: Learnable

**Core Principles and Purpose**
---------------------------------
- **Harness AI to enable learning across virtually any subject.**
- **Revolutionize education by replacing traditional classroom methods with innovative technology and AI-driven approaches.**
- **Personalize the learning experience—tailoring content selection and delivery tone to maximize effectiveness.**
- **Transform expert knowledge into structured lectures, empowering specialists to share insights and mentor others.**

**Core Functions of This App**
------------------------------
- **Engage with lectures in a structured, captivating format, supported by an AI-powered chat assistant for easier comprehension.**
- **Customize lectures fully with AI assistance, creating a personalized learning journey.**
- **Share or monetize your lectures via the Lecture Shop, expanding access to a wider audience.**
- **Reinforce learning with daily quizzes that apply spaced repetition, ensuring long-term retention of key topics.**


## Table of contents
|Requirement ID|Title|Scene ID|
|:---|:---|:--- |
| [FR-001](#fr-001) | Home Page | SC-001 |
| [FR-003](#fr-003) | Lecture Scene | SC-003 | 
| [FR-004](#fr-004)| Engagement Question | SC-003 |
| [FR-005](#fr-005)| Assistive AI Chat | SC-003 |
| [FR-006](#fr-006)| Table of Contents | SC-003|
| [FR-007](#fr-007)| Subject Management | SC-001 |
| [FR-008](#fr-008)| Subject Creation | SC-005 |
| [FR-009](#fr-009)| Daily Quiz | |
| [FR-010](#fr-010)| Optional Quiz | |
| [FR-011](#fr-011)| Question Management | SC-009 |
| [FR-012](#fr-012)| Setting Scene | SC-010|
| [FR-013](#fr-013)| Personal Achievement Scene | SC-002|
| [FR-014](#fr-014)| Subscription | TBD |

# Functional Requirements
1. ## <a id="fr-003"></a>Lecture Scene
**Requirement ID:** FR-003  
  
**Scene ID:** SC-003
### Descriptions:
- **Lecture Content Display:**  
   - The scene shall present lecture content in a **linear, top-to-bottom scrollable interface**.  
   - Navigation is restricted to moving forward and backward **within the current topic only**.
- **Specialized Content Rendering:**  
   - The system shall render **code blocks, math equations, and quoted messages** in dedicated containers to distinguish them from standard text.  
   - (Refer to the associated design specifications for style details.)
- **Topic-Based Navigation:**  
   - The scene shall display **one topic per scene**.  
   - Users must complete the current topic before accessing the next one.
- **Engagement Questions:**  
   - At the end of each topic page, the system shall interrupt the lecture content to display an **engagement question** ([FR-003.6](#fr-003-6)).  
   - A valid user response is required to proceed to the next topic page, after which feedback is provided.
- **Table of Contents Access:**  
   - The scene shall include a toggle button allowing users to access the **table of contents**.  
   - This enables users to view their progress and navigate to previously completed topics.
- **Chat Assistant:**  
   - The scene shall allow users to access a **chat assistant** ([FR-002](#fr-002)) for real-time guidance, explanations, and support related to the lecture content.  
   - The chat assistant box shall display the chat history for the current topic only.
   
### Acceptance Criteria
 - The system must provide smooth vertical scrolling from the start to the end of the topic.
 - Upon reaching the end of a topic, the engagement question must be triggered.  
 - A user must submit a response, after which appropriate feedback is provided before proceeding.
 - Code blocks, math equations, and quoted messages must be rendered with distinctive styles as per design specifications.
 - A toggle button must be available to open and close the table of contents.
 - It can also be accessed with left-to-right scroll gesture.   
 - The chat assistant must be accessible at any point during the lecture and display only the chat history relevant to the current topic.
    
### Rationale
- **Linear Navigation Focus:**  
  A linear, top-to-bottom scrolling interface ensures that users focus on one topic at a time, reducing cognitive load and maintaining a structured learning flow.
- **Enhanced Readability:**  
  Rendering code blocks, math equations, and quoted messages in dedicated containers enhances clarity and readability, making it easier for users to differentiate between types of content.
- **Active Engagement:**  
  Interrupting the lecture with an engagement question at the end of each topic reinforces learning by prompting users to reflect on and apply what they’ve learned, thereby improving retention.
- **Progress Awareness:**  
  The inclusion of a table of contents provides users with a clear view of their progress and facilitates easy navigation to previously completed topics, supporting a self-paced learning approach.
- **Immediate Support:**  
  Providing access to a chat assistant ensures that users can receive timely help and explanations, which is crucial for addressing uncertainties and maintaining engagement throughout the lecture.
   
    
2. ## <a id="fr-004"></a>Engagement Question  
**Requirement ID**: FR-004
   
**UI Requirement**: SC-003.6

### Descriptions:
- **Context of the question**:
    - The question shall be related to the current topic.
- **Flow interruption**: 
    - Users are required to provide a response to the question before proceeding to the next topic.
- **Types of question**: 
    - There shall be two types of engagement questions: multiple-choice and free-text-response.
- **Rendering order**:
    - The system shall present an engagement question at the end of each topic page, embedded at the end of the flow, not in separate page.
- **Answer feedback**:
    - Upon submitting their response, the system shall provide feedback, including an explanation or additional information, regardless the answer was correct or incorrect.
    - After receiving feedback, the system shall offer the user the option to ask one additional question or proceed with the next topic via rendering two buttons after the question.
         
### Acceptance Criteria:
- The system must display an engagment question at the end of each topic page.
- The engagement question must be either a multiple-choice question or a free-text-response question.
- The question must be embedded within the topic page, not on a separate page.
- Users must be requuired to submit a response to the question to proceed to the next topic.
- Upon submission, the system must provide feedback on the response, including an explanation or additional information, regardless of correctness.
- After feedback is provided, the system must present the user with two options: to ask one additional question or proceed with the next topic via rendering two buttons after the question.

### Rationale:
- **Active Engagement**:
    - Interrupting the lecture with an engagement question at the end of each topic reinforces learning by prompting users to reflect on and apply what they’ve learned, thereby improving retention.
- **Immediate Feedback**:
    - Providing immediate feedback, regardless of correctness, allows users to quickly correct misunderstandings and gain deeper insights into the topic. Additionally, the option to ask to provide another question at users request, to further solidify understanding, addressing uncertainties and maintaining engagement.
- **Personalized Learning**:
    - The ability to seek clarification on specific points of confusion through the chat assistant after receiving feedback supports a tailored learning experience, meeting individual user needs.
- **Linear Navigation Focus**:
    - Embedding the engagement question within the topic page ensures a seamless, linear flow of learning, reducing cognitive load and maintaining focus on the current topic without disrupting the user’s concentration.
      
3. ## <a id="fr-005"></a>Assistive AI Chat
**Requirement ID**: FR-005  

**UI Requirement**: UI-003.5  

### Descriptions:
- The system shall be accessible within the Lecture Scene (SC-003), utilizing a vertical sliding behavior within its own UI layer. Users can open or close the chat system via a toggle button within the Lecture Scene.
- The system shall maintain context awareness by tracking both the topic and chat history for interactions between the chat assistant and users. The system shall erase the chat history once moved forward to a different topic.
- The system shall provide **dedicated fields** with **specialized formatting support** and ensure compatability to standard rendering for entering programming code or mathematical equations. It will automatically detect such inputs and prompt users to embed a **special field** for the detected format. Users can also manually embed these **dedicated fields** via button in the chat text field.
- The system shall support multiple dedicated fields within the input flow, each functioning as a self-contained unit. Users shall be able to create, delete, and navigate between these fields, as well as return to a standard text input.
- The system shall provide additional keyboard input for commonly used characters when the typing keyboard and a special container mode is active, reducing the need for users to browse the default keyboard system. UI buttons that simulate keyboard keys shall be available while users are typing. (e.g., **tab** button for tab spaces when writing a programming code)
     
### Acceptance Criteria
- The chatbox should slide in top-bottom vertical behavior in it's own page (separate page in front of the topic page).
- The chatbox should open via engaging in type mode (clicking the chat assistant text field) and can be closed by clicking the close button while chatbox is active.
- The chat should retain the history of messages between the user and the AI.
- Chat history should reset after moving to another topic.
- Similar to **Specialized Content Rendering** of the **lecture requirement**, responses of the AI assistant that has special contents such as math expressions, programming codes and quouted messages should be rendered in their respective styling.
- The user should be able to activate a special typing mode, where once active, it enables an automatic formatting to the text that follows the current standard rendering. (TODO: Design specs should be written here for programming codes and math latex)
- While typing, the system should constantly monitor what the text is, if the text is to be predicted as a **specialized content** (code or math expression), it should highlight the text and prompt the user to activate a typing mode.
- While in typing mode, the keyboard should provide additional keyboard key for the commonly used characters for that mode that is not provided by the default keyboard. (TODO: Separated design spec should be provided)
- The chatbox should support multiple **dedicated fields** and the users have the option to create new field, step out (return to normal input), delete or enter to an existing field.

### Rationale
- **Seamless Integration with Lecture Scene**:
- The vertical sliding behavior and toggle button ensure the chat system integrates smoothly into the Lecture Scene without disrupting the user's focus on the primary content. By residing in its own UI layer, the chat remains accessible yet unobtrusive, allowing users to engage with the assistant as needed while maintaining a clean and intuitive interface. This aligns with UI-003.5’s goal of providing a cohesive and user-friendly experience.
- **Context Awareness for Enhanced Interaction**:
- Maintaining chat history and topic awareness enables the AI to provide relevant, coherent responses based on prior interactions, mimicking a natural conversation flow. Resetting the history when switching topics ensures that the assistant remains focused on the current subject, avoiding confusion or irrelevant responses. This is particularly valuable in an educational context where discussions often pivot between distinct concepts.
- **Support for Specialized Content**:
- The inclusion of dedicated fields with specialized formatting for programming code and mathematical equations addresses the need for precise, visually distinct rendering of technical content. Automatic detection and prompting for these formats reduce user effort, while manual embedding options empower advanced users with control. This dual approach accommodates varying levels of user expertise, ensuring accessibility for beginners and flexibility for experts.
- **Efficient Multi-Field Management**:
- Supporting multiple dedicated fields within the chat flow allows users to structure complex queries or responses (e.g., combining code snippets, equations, and explanatory text). The ability to create, delete, and navigate between fields enhances usability by offering a modular, organized input system. Returning to standard text input ensures versatility, catering to both technical and casual interactions.
- **Optimized Typing Experience**:
Providing additional keyboard inputs for commonly used characters (e.g., tab spacing in code) while in special container mode minimizes friction during technical input. This feature reduces reliance on default keyboard browsing, which can be cumbersome for frequent symbols or formatting needs in programming and mathematics. The UI buttons simulating keyboard keys further streamline the process, improving efficiency and user satisfaction.
- **Educational and Practical Value**:
- The combination of context retention, specialized rendering, and enhanced typing capabilities ensures the chat system is a powerful tool for learning and problem-solving. By rendering AI responses with proper styling (e.g., syntax-highlighted code, LaTeX-formatted equations), users receive clear, professional-grade feedback that mirrors real-world standards, reinforcing comprehension and application of lecture material.
  
4. ## <a id="fr-006"></a>Table of Contents
**Requirement ID**: FR-006
**UI Requirement**: UI-003.4
### Descriptions:
- The system shall display all topics in a list format within the Table of Contents, providing users with a comprehensive overview of the subject’s structure.
The Table of Contents shall be accessible within the Lecture Scene (SC-003) via a toggle button, allowing users to open or close it as needed without leaving the current context.
- The system shall allow navigation to completed topics by selecting them from the list, while preventing navigation to uncompleted topics to enforce sequential progress.
- The system shall display the current progress of the subject, visually indicating how much of the content has been completed by the user.
- The system shall signify the current topic with a distinct visual marker (e.g., bold text, highlight, or icon) to orient the user within the subject.
- The system shall indicate when a quiz is available and ready for a specific topic, using a clear visual cue (e.g., a badge or icon) to prompt user engagement.
- The system shall distinguish completed topics from uncompleted topics by rendering the text of uncompleted topics in gray, while completed topics remain in a standard, readable color (e.g., black or theme default).
  
### Acceptance Criteria
- The Table of Contents must present all topics in a vertically scrollable list, ensuring visibility of the entire subject structure, even for lengthy subjects.
- The toggle button must be prominently placed within the Lecture Scene and, when clicked, smoothly open or close the Table of Contents in its own UI layer without obstructing the lecture content.
- A horizontal sliding gesture (left-right) can also be used to open or close the Table of Contents section.
- Clicking on a completed topic in the list must immediately navigate the user to that topic, while clicking on an uncompleted topic must have no effect or display a brief message (e.g., “Topic not yet unlocked”).
- The current topic must be visually distinct (e.g., bolded, highlighted, or marked with an icon) and automatically updated as the user progresses through the subject.
- Completed topics must appear in a standard, legible color (e.g., black), while uncompleted topics must be rendered in gray, with sufficient contrast to remain readable but clearly differentiated.
- The system must refresh the Table of Contents state (progress, current topic, quiz availability) in real-time as the user interacts with the Lecture Scene.
  
### Rationale
The Table of Contents (FR-006) serves as a navigational and motivational tool within the Lecture Scene, enhancing user experience by providing structure, clarity, and feedback on progress. The following points justify its design and functionality:

- **Comprehensive Topic Overview**:
- Displaying all topics in a list format offers users a clear roadmap of the subject, fostering an understanding of its scope and sequence. This is essential for educational contexts where users benefit from knowing what lies ahead and how topics interrelate.
- **Seamless Accessibility**:
- The toggle button ensures the Table of Contents is readily accessible without disrupting the Lecture Scene workflow, while its seamless integration with the main topic page and smooth transition animation help users maintain focus.
- **Controlled Progression**:
- Restricting navigation to completed topics enforces a logical learning sequence, preventing users from skipping foundational material. This supports educational integrity and ensures users build knowledge incrementally, which is critical for subjects with interdependent concepts.
- **Contextual Awareness**:
- Signifying the current topic keeps users oriented within the subject, reducing cognitive load and enhancing focus. This is particularly valuable in long or complex lectures where users might otherwise lose track of their position.
- **Visual Differentiation**:
- Rendering uncompleted topics in gray provides an immediate, intuitive distinction from completed topics, leveraging color psychology to signal accessibility. This visual cue simplifies decision-making and reinforces the sequential progression model.


## <a id="fr-007"></a>Subject Management
1. ### Subject Management Scene
**Requirement ID**: FR-007  

**Scene ID**: TBD
### Descriptions:
- Users should be able to create a new subject from this scene, allowing them to add new learning modules or courses to their list.
- Users can delete a subject, with a confirmation step to prevent accidental removal.
- Users can choose a subject from this scene to access its associated content, such as lectures or quizzes.
- Users can sort subjects based on:
   - **Name**: Alphabetical order (A-Z or Z-A).
   - **Progress in percent**: Percentage of completion (e.g., 0% to 100%).
   - **Last date of accessed**: Date the subject was last viewed, from most recent to oldest.
- Each subject on the list should display:
   - **Title**: The name of the subject in a clear, prominent format.
   - **Progress in percent**: A percentage indicating how much of the subject has been completed (e.g., "75%").
   - **Date last time accessed**: The most recent date the subject was opened (e.g., "2023-10-10").
   - **Total of chapters**: The total number of chapters or sections in the subject (e.g., "10 chapters").
- Each subject should have a button at the very right where, when clicked, it will open up a list of options, including "Delete" and potentially other actions like "Rename" or "Archive."
### Acceptance Criteria:
- **Creating a Subject**:
   - A "Create New Subject" button must be visible and functional, allowing users to add a new subject.
Upon creation, the users must be navigated to the **New subject creation page**.
- **Deleting a Subject**:
   - Selecting "Delete" from the options button must trigger a confirmation prompt (e.g., "Are you sure you want to delete this subject?").
   - After confirmation, the subject must be removed from the list.
- **Choosing a Subject**:
   - Clicking a subject (outside the options button) must navigate the user to that subject’s content or overview page.
   - Navigation must occur without delay or errors.
- **Sorting Subjects**:
   - A sorting control (e.g., dropdown or buttons) must allow selection of name, progress, or last accessed date.
   - The list must update instantly to reflect the chosen sorting order.
- **Subject Display**:
   - Each subject entry must show:
      - **Title** (e.g., "Mathematics").
      - **Progress in percent** (e.g., "50% complete").
      - **Last accessed date** (e.g., "Last accessed: October 10, 2023").
      - **Total chapters** (e.g., "8 chapters").
   - Information must be accurate and visually distinct (e.g., progress as a percentage or bar).
- **Options Button**:
   - A button (e.g., three dots or gear icon) must appear at the far right of each subject.
   - Clicking it must display a menu with at least "Delete" as an option.
   - The menu must be easy to access and dismiss.
- **Edge Cases**:
   - If no subjects exist, display a message like "No subjects available. Create one to begin."
   - Subjects with no progress (0%) or no access history ("Never accessed") must still display correctly.
### Rationale:
The Subject Management Scene is a core feature for users to organize and interact with their educational content. Here’s why each component is included:

- **Creating and Deleting Subjects**:
   - Users need the ability to add new subjects as their learning needs evolve and remove those no longer relevant, ensuring a tailored experience. The confirmation on deletion protects against mistakes.
- **Choosing Subjects**:
   - Direct access to a subject’s content from this scene simplifies navigation, making learning more efficient and intuitive.
- **Sorting Functionality**:
   - Sorting by name, progress, or last accessed date accommodates different user priorities—finding subjects quickly, tracking progress, or resuming recent work—enhancing usability.
- **Subject Information Display**:
   - Showing title, progress, last accessed date, and chapter count gives users a clear overview, motivating them with progress visibility and informing them of subject scope and recency.
- **Options Button**:
   - Placing actionable options (like "Delete") in a right-side button keeps the interface clean while providing essential controls. This design balances functionality with simplicity.

  
2. ## <a id="fr-008"></a>Subject Creation Scene
**Requirement ID**: FR-008  

**Scene ID**: SC-005  

### Descriptions:
   The Subject Creation Scene is a 3-step wizard designed to help users generate a customized curriculum for a new subject. The wizard takes user inputs and preferences to create a structured output in the following structured format:
- **A title**:
   - This is a string that represents the name or identifier of the entire structure, such as curriculum or course.
- **A list of subjects**:
   - This is a collection of subjects, where each subject is an individual entity. There must be at least on subject.
- **Each subject contains**:
   - **A list of topics**:
      - A collection of topics, where each topic is represented as a string. Each subject must have at least one topic in its list.
```
Curriculum Title
   Subject 1
      Topic 1
      Topic 2
   Subject 2
      Topic 1
      Topic 2
```        

**Here’s how the wizard works, step by step**:

### Step 1: Create Base Curriculum
 - **User Input**:
    - Users start by describing the subject or course in a free-text box. This description serves as the foundation for the AI to generate a curriculum or table of contents.
 - **Preset Options**:
    - An additional option allows users to select a preset (e.g., "comprehensive" or "basic to advanced") that modifies the curriculum’s depth and structure. This preset enhances the free-text input rather than replacing it.
 - **System Response**:
    - The system generates a curriculum based on the user’s description and selected preset (if any) and displays it for review.
 - **Editing**:
    - Users can confirm the curriculum as-is or edit it using an AI-assisted text field, which allows for real-time customization of the generated list.
### Step 2: Tone of Delivery
   - **Tone Customization**:
      - Users define how the content for each subtopic will be delivered by specifying a tone (e.g., "ELI5," "in a piratey way," or "like my mom") in a free-text input field.
   - **Preset Options**:
      - Similar to Step 1, preset tone options are available and can be combined with the free-text input for greater flexibility.
   - **Tone Preview**:
      - The system generates an example of how the tone will be applied to one of the curriculum topics. A "Refresh" button is provided to update the example if the user modifies the tone input—users must press this button to see changes reflected.
   - **User Control**:
      - This step ensures users can fine-tune the tone to make the content engaging and suited to their audience.
### Step 3: Add-ons
   - **Selection Method**:
      - Users are presented with clickable radio options to add extra features to the subject. These options are independent and can be toggled on or off.
   - **Available Add-ons**:
      - **Engagement Question**:
         - Adds an engagement question at the end of each topic to encourage interaction. (Default: True)
      - **Ending Project**:
         - Adds a hands-on, practical exercise at the end of each major topic (not subtopics). These projects are more challenging than engagement questions. (Default: True)
      - **Generate Voice**:
         - Generates narrated voice content for the entire subject. (Default: False)
      - **Generate Questions for Reinforcement**:
         - Adds questions to a reinforcement system (e.g., for spaced repetition or review). (Default: False)
      - **Final Action**:
         - A **Generate** button is placed at the bottom of this step. When clicked, it triggers the creation of the full subject material based on all prior inputs and navigates the user to a loading screen while the content is prepared.
### How It All Ties Together
   - **Step-by-Step Flow**:
      - The wizard progresses sequentially from Step 1 (defining the curriculum) to Step 2 (setting the tone) to Step 3 (adding features). Each step builds on the previous one, ensuring a cohesive and personalized subject-creation process.
   - **Navigation**:
      - Users can effortlessly navigate through the steps by scrolling vertically, as each step is seamlessly connected in a single, continuous interface. This intuitive design eliminates the need for separate page transitions, keeping the process fluid and user-friendly. 
   - **User Feedback**: 
      - At every stage, the system provides previews or editable outputs, giving users control and confidence in the final product.
   - **Output**:
      - Once the "Generate" button is clicked, the system compiles the curriculum, applies the chosen tone, and incorporates the selected add-ons, delivering a fully customized subject ready for use.

### Acceptance Criteria
The Acceptance Criteria outline the specific conditions that must be met to ensure the Subject Creation Scene works as intended. These are broken down by the three steps of the process and include general requirements:

#### Step 1: Create Base Curriculum
   - **Free-Text Input**:
      - The free-text box must accept user input and process it to generate a curriculum. The AI should produce a structured list of topics and subtopics based on the provided description.
   - **Preset Selection**:
      - Preset options (e.g., "comprehensive," "basic to advanced") must be selectable and modify the curriculum’s structure accordingly.
   - **Curriculum Preview and Editing**:
      - The system must display the generated curriculum in a clear, structured format, accompanied by a text field where users can input edits with AI assistance. Changes made by the user should take effect only after pressing the "Refresh" button.
#### Step 2: Tone of Delivery
   - **Tone Input**:
      - The free-text field for tone description must accept input, and preset tone options must be selectable.
   - **Tone Example Generation**:
      - The system must generate an example of the selected tone applied to a random topic from the curriculum. This example should only refresh when the "Refresh" button is clicked after changes are made.
   - **Refresh Functionality**:
      - The "Refresh" button must work only if either input text-field-box is filled or a preset option is selected, triggering a new tone example based on the current tone settings. 
#### Step 3: Add-ons
   - **Radio Options**:
      - Add-ons (e.g., Engagement Questions, Generate Voice) must be presented as clickable radio buttons or checkboxes, with default settings (e.g., Engagement Question: True, Generate Voice: False).
   - **Generate Button**:
      - A prominent "Generate" button must appear at the bottom of this step. When clicked, it must start the subject creation process and display a loading screen.
   - **Loading Screen**:
      - The loading screen must show a progress indicator or message to inform users that the subject is being generated.
### General
   - **Navigation**:
      - Users must be able to move between the three steps freely by scrolling vertically until the final "Generate" action is completed.
   - **Error Handling**:
      - If any step is incomplete (e.g., no curriculum created), the system must display a prompt requiring the user to fill in the necessary fields before proceeding.
   - **Data Persistence**:
      - User inputs must be temporarily saved during the process, allowing users to go back and edit without losing their work.

### Rationale
The Rationale explains why these features are included and how they support the overall purpose of the Subject Creation Scene:

- **Step-by-Step Wizard**:
   - Dividing the process into three steps—curriculum creation, tone selection, and add-ons—makes it easier for users to manage. This reduces complexity and helps users focus on one task at a time, improving the overall experience.
- **AI-Powered Curriculum Generation**:
   - Using AI to generate an initial curriculum saves time and provides a helpful starting point, especially for users unsure of how to structure their content. The editing option ensures they retain full control.
- **Tone Customization**:
   - Letting users define the tone ensures the content suits their audience and promotes personalized customization which enhances the learning experience. The tone preview builds confidence that the chosen tone will be consistently applied.
- **Add-ons for Enhanced Learning**:
   - Optional add-ons like engagement questions and voice narration enrich the learning experience, catering to diverse preferences and encouraging active participation.
- **User Control and Feedback**:
   - Features like the "Refresh" button and editable curriculum keep users in charge, while the loading screen confirms the system is processing their request.




## Reinforcement Feature
1. ## <a id="fr-009"></a>Daily Quiz Scene
**Requirement ID**: FR-009  
 
**SC ID**: SC-006
### Descriptions:
The Daily Quiz Scene is a key feature designed to reinforce user learning through a structured, daily quiz activity. Here’s how it works:
- **Activation**:
   -  The quiz activates every time the app is opened for the first time each day. If the daily reinforcement activity (i.e., the quiz) hasn’t been completed, it takes precedence over all other app features, ensuring users engage with it before proceeding.
- **Question Formats**:
   - **Questions are presented in two formats**:
      - **Multiple Choice**:
         - Users select the correct answer from a set of options.
      - **Free-Text-Field**:
         - Users type their answers without provided options.
- **Question Presentation**:
   - The system shall present one question per page. Each page includes:
      - **Body of Question**:
         - The question text displayed promintently at the top
      - **Answer Input**:
         - Below the body, an input area (either multiple-choice options or a text field) for the user to respond.
      - **Submit Button**:
         - Positioned below the input area to submit the answer.
      - **Feedback Area**:
         - Located below the body of the question (and alongisde the input area), where feedback appears after submission. If the feedback is rendered, a "Next" button shall also appear to allow users to proceed to the next question.
- **Question Generation**:
   - All questions are generated based on topics the user has completed. Generation happens instantly upon topic completion, ensuring relevance to the user’s progress.
- **Question Pool**:
   - Generated questions are stored in a "question pool," which operates as a queue. The frequency assigned to each question determines whether it appears in the day’s reinforcement activity.
- **Levels of Questions**:
   - Questions are categorized into levels, each with specific attributes:
      - **Difficulty**:
         - How challenging the question is.
      - **Frequency:**
         - How often the question reappears.
      - **Format**:
         - How the question is presented (multiple choice or free-text).
      - **Occurrence**:
         - The number of times a question must be answered correctly before advancing to the next level.
### Levels of Questions
- **Level 1**:
   - **Difficulty**: Basic
   - **Frequency**: Every 1-2 days
   - **Format**: Multiple choice
   - **Occurrence**: 7 correct answers required to progress
- **Level 2**:
   - **Difficulty**: Intermediate (e.g., simple problem solving)
   - **Frequency**: Every 3-4 days
   - **Format**: Multiple choice or free-text (system can use either)
   - **Occurrence**: 7 correct answers required to progress
- **Level 3**:
   - **Difficulty**: Advanced (e.g., advanced problem solving)
   - **Frequency**: Every 7-8 days
   - **Format**: Free-text
   - **Occurrence**: 7 correct answers required to progress
- **Level 4**:
   - **Difficulty**: Master (e.g., explanation, practical challenges)
   - **Frequency**: Every 14-15 days
   - **Format**: Free-text
   - **Occurrence**: 7 correct answers required to complete
- **Mastered Status**:
   - After completing Level 4 (7 correct answers), the question is marked as Mastered.
   - Mastered questions reappear every 20 days with a random difficulty level.
   - Users can disable the recurrence of mastered questions via the Question Management Scene.
### Workflow
- **Generation**:
   - When a user completes a topic, questions are created and added to the question pool at Level 1.
- **Scheduling**:
   - Each question has a due date based on its frequency. The daily quiz includes questions whose due date is today or earlier.
- **Progression**:
   - When a question is answered correctly, its due date is updated within its level’s frequency range. After 7 correct answers at a level, it advances to the next level, updating its format and frequency.
- **Daily Quiz**:
   - On the first app open of the day, if questions are due, the quiz is presented. Users must complete it to access other features unless skipped. If no questions are due, the quiz is skipped.
 
     
### Acceptance Criteria
To ensure the Daily Quiz Scene meets its intended purpose, the following must be verified:
- The quiz appears on the first app open of the day if the reinforcement activity hasn’t been completed and questions are due.
- The quiz is skippable, but if skipped, a notification or indicator must appear on the homepage showing that a quiz is due for today.
- Questions are generated instantly after a topic is completed and added to the question pool at Level 1.
- The system tracks each question’s level, frequency, format, and correct answer count accurately.
- For multiple choice questions, the system verifies correctness automatically.
- For free-text questions, the system shows the correct answer after submission, and the user self-assesses correctness.
- After 7 correct answers at a level, the question advances to the next level, with updated frequency and format.
- Mastered questions (post-Level 4) appear every 20 days with random difficulty unless disabled by the user in the Question Management Scene.
- If no questions are due, the quiz does not appear, and the app should navigate to the homepage immediately.
### Rationale
The Daily Quiz Scene uses a spaced repetition approach to reinforce learning, gradually increasing question difficulty and intervals as users demonstrate mastery. By presenting the quiz on the first daily app open with a skippable option, it encourages consistent engagement while offering flexibility. The two question formats cater to different learning styles—multiple choice for quick recall, free-text for deeper understanding. The level system and question pool provide a structured progression, while the option to disable mastered questions respects user preferences, making the feature both effective and adaptable.

2. ## <a id="fr-010"></a>Optional Quiz
**Requirement ID: FR-010  

**Scene ID: TBD

### Descriptions

The Optional Quiz is a user-initiated feature designed to provide additional practice without impacting the progress or attributes of questions in the main reinforcement system. Here’s how it functions:

- **Question Quantity**:
   - The system shall present 5 questions at a time per quiz session.
- **Question Selection**:
   - Questions are pulled randomly from the existing "question pool" (as used in the Daily Quiz Scene). The selection includes:
      - **Random Difficulty**: Any difficulty level (Basic, Intermediate, Advanced, Master).
      - **Random Format**: Either multiple choice or free-text, independent of the question’s original level-specific format.
- **Non-Impactful**:
   - Completing or answering questions in the Optional Quiz does not update the progress, frequency, occurrence count, or any other attributes of the questions in the question pool.
- **Question Presentation**:
   - The rendering and format for displaying each question match the Daily Quiz Scene (FR-006):
      - One question per page.
      - Includes the body of the question, an answer input area (multiple choice options or text field), a submit button, and a feedback area below the question body.
      - After submission, feedback is rendered, and a "Next" button appears to proceed to the next question.
- **Error Handling and Termination**:
   - **No Time Limit**: There is no timeout or time restriction for completing the quiz.
   - **App Termination**: If the app is closed or terminated while the quiz is in progress, no data is saved or affected. Upon reopening the app, it resumes normal operation, bypassing the quiz unless the user initiates it again.
### Workflow
1. Users manually start the Optional Quiz from an accessible point in the app (e.g., a button on the homepage or a menu).
2. The system randomly selects 5 questions from the question pool, ignoring their current level or due status.
3. Questions are presented one at a time, following the same layout as the Daily Quiz.
4. After answering all 5 questions, the quiz ends, returning the user to normal app operation.
5. If interrupted (e.g., app closure), the quiz resets upon the next app launch, with no record of the prior session.
### Acceptance Criteria
To ensure the Optional Quiz meets its intended purpose, the following conditions must be verified:

- The quiz presents exactly 5 questions per session when initiated.
- Questions are randomly selected from the question pool, with varying difficulty (Basic, Intermediate, Advanced, Master) and format (multiple choice or free-text) each time.
- Answering questions (correctly or incorrectly) does not alter the question’s progress, frequency, occurrence count, or level in the question pool.
- Each question page displays:
   - The question body.
   - An answer input (multiple choice options or text field) below the body.
   - A submit button below the input.
   - Feedback below the question body after submission, with a "Next" button to proceed.
- The quiz has no time limit; users can take as long as needed to answer each question.
- If the app is terminated mid-quiz (e.g., closed or crashed), no quiz progress is saved, and reopening the app navigates to the homepage or normal operation without resuming the quiz.
- The quiz is only accessible via user initiation (e.g., a button or menu option), not triggered automatically like the Daily Quiz.
### Rationale
The Optional Quiz provides a low-stakes, flexible practice option for users who want additional engagement without affecting their structured learning progress. Here’s why each aspect is included:

- **Fixed Question Count (5)**: Limiting the quiz to 5 questions keeps it manageable and focused, encouraging casual use without overwhelming the user.
- **Random Selection**: Pulling questions randomly from the pool with varying difficulty and format ensures variety and unpredictability, making it a fun and challenging practice tool.
- **Non-Impactful Design**: By not updating question attributes, the feature preserves the integrity of the spaced repetition system in the Daily Quiz, maintaining its effectiveness while offering supplemental practice.
- **Consistent Presentation**: Reusing the Daily Quiz’s question layout ensures a familiar user experience, reducing the learning curve and maintaining visual consistency across the app.
- **No Time Limit**: Removing time pressure accommodates different paces and preferences, making the quiz accessible to all users.
- **Termination Handling**: Allowing app closure without consequences aligns with the optional nature of the feature, ensuring it’s a stress-free addition to the app. 
  
This feature enhances user autonomy and supports voluntary learning, complementing the app’s structured reinforcement system with a casual, user-driven alternative.




     
2. ## <a id="fr-007"></a>Personal Achievement Scene
**Requirement ID**: FR-013 

**Scene ID**: SC-002
### Description**:
The Personal Achievement Scene allows users to view and track their overall progress within the app. It serves as a motivational and analytical hub, presenting key statistics and insights about their learning journey. The system shall provide the following features:

- **Progress Metrics**: The scene shall display the following user progress data:
	- **Total of Generated Subjects**: The number of subjects created by the user.
	- **Total of Completed Subjects**: The number of subjects fully completed.
	- **Total of Questions Generated**: The total number of questions created across all subjects.
	- **Total of Questions Answered**: The total number of questions the user has responded to (correct or incorrect).
	- **Total Time Studying**: The cumulative time spent studying, tracked across all activities.
- **Streaks Tracking**: The system shall display:
	- **Study Streaks**: The number of consecutive days the user has studied.
	- **Quiz Streaks**: The number of consecutive days the user has completed the daily quiz.
	- These streaks are presented in a calendar view, with a toggle option to switch between study streaks and quiz streaks.
- **Efficiency and Mastery Evaluation**: The system shall evaluate each subject’s efficiency and mastery based on:
	- The percentage of completion for each subject.
	- The ratio of total generated questions to correct answers for that subject.
	- This evaluation shall be visualized in a graph view (e.g., bar or line graph) for each subject.
- **AI-Driven Evaluation**: The system shall include a feature where an AI analyzes the user’s overall progress and provides a textual evaluation. This evaluation covers:
	- Progress across the entire course.
  	- User shortcomings (e.g., areas with lower mastery or slower progress).
	- User strengths (e.g., subjects or topics with high completion and accuracy).
	- Example output: "You’ve completed 80% of Mathematics with strong accuracy in algebra but could improve in geometry, where only 50% of questions were answered correctly."
### Workflow
- Users access this scene to get a snapshot of their learning achievements.
- The progress metrics and streaks update in real-time as the user interacts with subjects and quizzes.
- The graph view and AI evaluation dynamically reflect the latest data, offering actionable insights.
  
### Acceptance Criteria
To ensure the Personal Achievement Scene meets its intended purpose, the following must be verified:

1. The scene displays accurate counts for:
	- Total generated subjects.
	- Total completed subjects.
	- Total questions generated.
	- Total questions answered (regardless of correctness).
	- Total study time (in a readable format, e.g., hours and minutes).
2. A calendar view shows study streaks and quiz streaks, with a functional toggle to switch between the two views.
3. Streaks reset to zero if a day is missed for either studying or taking the daily quiz, and the calendar reflects this accurately.
4. For each subject, a graph visualizes:
	- Completion percentage (e.g., 75% complete) if the "all subject" (default item) is selected.
	- Mastery score percentage of correct answers for the selected subject.
5. The AI evaluation feature generates a text summary that:
	- Reflects the user’s overall progress for the selected subject.
	- Identifies at least one strength and one shortcoming based on data (e.g., high accuracy in one subject, low completion in another).
	- Updates whenever new progress data is available.
6. All displayed data (metrics, streaks, graphs, AI text) must match the user’s actual activity in the app.
7. The scene loads without delay and updates dynamically as the user progresses through subjects or quizzes.
### Rationale
The Personal Achievement Scene is designed to motivate users and provide actionable feedback on their learning journey. Here’s why each component is included: 

- **Progress Metrics**: Displaying totals for subjects, questions, and study time gives users a clear, quantifiable sense of their efforts, fostering a sense of accomplishment and encouraging continued engagement.
- **Streaks in Calendar View**: Tracking daily study and quiz streaks in a toggleable calendar format gamifies the experience, leveraging habit formation to boost consistency. The toggle keeps the interface clean and focused.
- **Efficiency and Mastery Graphs**: Visualizing subject completion and question accuracy in a graph offers an intuitive way to assess performance, helping users identify areas needing improvement at a glance.
- **AI Evaluation**: The textual analysis by AI personalizes the experience, offering insights beyond raw numbers. Highlighting strengths and shortcomings empowers users to adjust their focus, aligning with the app’s goal of enhancing learning efficiency.
This scene combines data-driven insights with motivational elements, making it a vital tool for users to reflect on and optimize their educational progress within the app.



  
		
8. ## <a id="fr-001"></a>Home Scene
**Requirement ID**: FR-001  

**Scene ID**: SC-001
### Descriptions:
The Home Scene serves as the primary landing page when the app is freshly opened (i.e., a fresh startup, not reopened from a minimized state), unless the daily quiz has not been completed, in which case the Daily Quiz Scene (FR-006) takes priority. The scene is designed to provide quick access to key features and an overview of the user’s current activities. Here’s how it’s structured:

- **Recent Lecture Section**: A prominent area displays the most recent lecture or study material the user was working on. It includes a "Resume" button, allowing users to pick up where they left off in their studies.
- **Subject Library**: Another prominent area lists the subjects in the user’s library. This section ties into the functionality detailed in the Subject Management Scene (FR-004), providing a summary view of available subjects.
- **Navigation Bar**: Located at the bottom of the screen, a navigation bar contains buttons to access the following scenes:
- **Library**: Returns to or remains on the Home Scene (SC-001).
- **Personal Achievement Scene**: Navigates to SC-002.
- **Search Scene (Book Marketplace)**: Navigates to a scene for browsing educational content or resources.
- **Question Management**: Navigates to a scene for managing quiz questions (e.g., disabling mastered questions).
- **Settings**: Navigates to the app’s settings scene.
- **Notification Bar**: Positioned at the very top of the layout, this responsive bar displays notifications when applicable, such as:
	- A reminder that the daily quiz is due if not yet completed.
	- Promotional messages (e.g., advertising a subscription mode).
	- If no notifications are present, the bar collapses, and the remaining UI elements expand to fill the space; otherwise, it inserts itself at the top, pushing content downward.
- **Quick Quiz Button**: A button is present to initiate the Optional Quiz (FR-010), navigating the user to its dedicated scene (SC-010) upon clicking.
- **New Subject Button**: A button allows users to add a new subject, navigating to the Subject Creation Scene (FR-005, SC-005) when clicked.
### Workflow
- On a fresh app launch, if the daily quiz is incomplete, the user is directed to SC-006 first. Otherwise, SC-001 loads.
- The scene prioritizes resuming recent activity and accessing subjects, with navigation options for deeper exploration or management.
#### Acceptance Criteria
To ensure the Home Scene functions as intended, the following must be verified:

- On a fresh app startup (not from minimize), the Home Scene loads unless the daily quiz is due, in which case the Daily Quiz Scene (SC-006) appears first.
- The "Recent Lecture" section prominently displays the title or details of the most recently accessed lecture, with a functional "Resume" button that navigates to the exact point where the user left off.
- The subject library section lists all user subjects (consistent with FR-004), showing at least their titles, and allows navigation to the Subject Management Scene if interacted with further.
- The navigation bar at the bottom includes five buttons (Library, Personal Achievement, Search, Question Management, Settings), each correctly navigating to its respective scene:
	- **Library:** Stays on SC-001.
	- **Personal Achievement**: SC-002.
	- **Search Scene**: Book marketplace scene.
	- **Question Management**: Question management scene.
	- **Settings**: Settings scene.
- The notification bar at the top:
	- Displays a "Quiz Due" message if the daily quiz is incomplete, visible until completed or skipped.
	- Shows promotional messages (e.g., subscription ads) when triggered.
	- Collapses when no notifications are active, with the UI adjusting responsively to fill the space.
- A "Quick Quiz" button is visible and, when clicked, navigates to the Optional Quiz Scene (SC-010).
- A "New Subject" button is visible and, when clicked, navigates to the Subject Creation Scene (SC-005).
- All elements load without delay and remain accessible regardless of notification bar state.
### Rationale
The Home Scene is the central hub of the app, designed to streamline user interaction and encourage continued learning. Here’s why each feature is included:

- **Fresh Startup Priority**: Defaulting to the Home Scene (unless the daily quiz is due) ensures users have immediate access to their learning materials, while prioritizing the quiz maintains reinforcement consistency.
- **Recent Lecture Section**: Highlighting the last lecture with a "Resume" button reduces friction, allowing users to dive back into their studies effortlessly, which is key for retention and engagement.
- **Subject Library**: Summarizing subjects ties into the broader management system (FR-004), giving users a quick overview and entry point to their content.
- **Navigation Bar**: Placing essential navigation at the bottom ensures accessibility and aligns with mobile design standards, supporting exploration of achievements, resources, and settings.
- **Notification Bar**: A responsive top bar keeps users informed about critical tasks (e.g., quizzes) or promotions without cluttering the interface when inactive, balancing utility and aesthetics.
- **Quick Quiz and New Subject Buttons**: These options empower users to practice voluntarily or expand their library, enhancing flexibility and personalization.
  
This scene balances immediate usability with long-term engagement, serving as an intuitive gateway to the app’s core features. 





9. ## <a id="fr-011"></a>Question Management Scene
**Requirement ID**: FR-011 
     
**Scene ID**: SC-009
### Descriptions
The Question Management Scene provides users with an interface to oversee and manage the question pool used in both the Daily Quiz Scene (FR-009) and the Optional Quiz (FR-010). This scene focuses on visibility and limited control over the questions, with the following features:

- **View Question Pool**: Users can view all questions currently in the question pool, which includes questions generated from completed topics and used in daily and optional quizzes.
- **Delete Questions**: Users can delete individual questions from the pool. However, at this initial version, updating existing questions or adding new ones manually will not be supported.
- **Question Statistics**: For each question, the system shall display detailed statistics, including:
	- **Times Asked**: The total number of times the question has been presented to the user (across both daily and optional quizzes).
	- **Times Correctly Answered**: The total number of times the user has answered the question correctly.
### Workflow
- Users navigate to this scene (e.g., via the navigation bar in the Home Scene) to review their question pool.
- Questions are listed with their associated stats, and a delete option is available for each.
- Deleting a question removes it permanently from the pool, affecting its availability in future quizzes.
### Acceptance Criteria
To ensure the Question Management Scene meets its intended purpose, the following must be verified:

- The scene displays a complete list of all questions in the question pool, sourced from both the Daily Quiz and Optional Quiz systems.
- Each question entry shows:
	- The question text (e.g., "What is 2 + 2?").
	- **Statistics**:
		- "Times Asked" (e.g., "Asked: 5 times").
		- "Times Correctly Answered" (e.g., "Correct: 3 times").
- A "Delete" option (e.g., a button or icon) is available next to each question.
- Clicking "Delete" removes the question from the pool permanently, and it no longer appears in future daily or optional quizzes.
- Deleting a question requires a confirmation prompt (e.g., "Are you sure you want to delete this question?") to prevent accidental removal.
- The system does not provide options to manually add new questions or edit existing ones in this version.
- Statistics for each question accurately reflect the user’s history (e.g., matching the number of times asked and answered correctly in past quizzes).
- The scene loads without delay and updates the list immediately after a question is deleted.
### Rationale
The Question Management Scene empowers users with visibility and control over their learning reinforcement system, while keeping the initial implementation simple. Here’s why each feature is included:

- **View Question Pool**: Displaying all questions gives users transparency into the content driving their quizzes, helping them understand what they’ve encountered and mastered.
- **Delete Functionality**: Allowing deletion without updating or adding (in this version) provides a basic level of customization, letting users remove questions they no longer want (e.g., mastered or irrelevant ones), while keeping development scope manageable.
- **Question Statistics**: Showing "Times Asked" and "Times Correct" offers valuable feedback on question exposure and performance, aiding users in assessing their consistency and areas of difficulty.
- **Limited Scope**: Excluding add/edit features in the first version simplifies the interface and prioritizes core functionality, with potential expansion in future updates based on user needs.
This scene supports user autonomy by providing insight and control over the quiz system, enhancing the app’s personalization while aligning with a phased development approach.

     
10. ## <a id="fr-012"></a>Setting Scene
**Requirement ID**: FR-012 

**Scene ID**: SC-010
### Descriptions
The Setting Scene is where users can configure various aspects of their app experience. It serves as a centralized hub for personalization and account management. The scene operates as follows:

- **Landing Scene**: Upon entering, users see a list of configurable settings. Clicking each item navigates to a dedicated sub-page for that setting.
- **Configurable Settings**:
	- Account Information:
		- An optional section for users to fill out, recommended when distributing self-authored courses via the book marketplace to establish credibility and build an audience.
		- **Editable fields**:
			- **Name**: User’s full name.
			- **Occupation**: User’s job or profession.
			- **Workplace**: User’s employer or institution.
			- **Bio**: A short description of the user.
		- Includes an explanatory section:
			- States that this information is optional but suggested for course distribution.
			- Assures users that personal data is used only for the intended purpose (e.g., course authorship display).
			- Confirms compliance with applicable data protection regulations.
- **Theme and Fonts**:			
	- Allows customization of font size and style for three distinct areas:
		- **System Layout**: Menus and navigation (excluding subject material).
		- **Subject Material**: Lecture and study content.
		- **Chat Assistant**: Chat interface (excluding special containers like code/math fields).
- **Keyboard**:
	- Enables or disables two special formatters in the keyboard:
		- **Code Block**: For programming code input.
		- **Math LaTeX**: For mathematical equation input.
- **Notification**:
	- Toggle settings for reminders:
		- Reinforcement Activity Reminder: Notifies if the daily quiz isn’t taken that day.
		- 15-Minute Study Reminder: Alerts if no studying occurs that day.
		- Quick Reinforcement Activity: Adjustable frequency for optional quiz reminders.
- **Data and Privacy**:
	- No user-configurable options, but provides:
		- **Download Data**: Exports user data in JSON format.
		- **Terms of Service**: Viewable document.
		- **Privacy Policy**: Viewable document.
- **Subscription**:
	- Displays current subscription perks (if subscribed).
	- Offers options to:
		- Cancel an active subscription.
		- Subscribe if not currently enrolled.
- **Delete Data and Start Over**:
	- Allows users to erase all app data for a fresh start, with a confirmation modal required before execution.
- **Delete Account**:
	- Permits users to terminate their account and delete all associated data, with a confirmation modal required before execution.
### Workflow
- Users access the scene via the navigation bar (e.g., from the Home Scene).
- The list of settings acts as a menu, with sub-pages providing detailed configuration options or information.
### Acceptance Criteria
To ensure the Setting Scene meets its intended purpose, the following must be verified:

- The landing page displays a list of all settings (Account Information, Theme and Fonts, Keyboard, Notification, Data and Privacy, Subscription, Delete Data, Delete Account), each clickable to a sub-page.
- **Account Information sub-page**:
	- Allows editing of Name, Occupation, Workplace, and Bio.
	- Displays an explanation about optional use, data purpose, and regulatory compliance.
- **Theme and Fonts sub-page**:
	- Offers font size and style options for System Layout, Subject Material, and Chat Assistant, with changes applied instantly upon selection.
- **Keyboard sub-page**:
	- Provides toggles to enable/disable Code Block and Math LaTeX formatters, affecting keyboard behavior in relevant areas.
- **Notification sub-page**:
	- Includes toggles for Reinforcement Activity, 15-Minute Study, and Quick Reinforcement reminders.
	- Allows frequency adjustment for Quick Reinforcement (e.g., daily, weekly).
- **Data and Privacy sub-page**:
	- Offers a "Download Data" button that exports a JSON file.
	- Provides viewable links for Terms of Service and Privacy Policy.
- **Subscription sub-page**:
	- Shows current subscription details (if any).
	- Includes "Cancel" and "Subscribe" options based on user status, with functional navigation to payment flows.
- **Delete Data and Start Over sub-page**:
	- Displays a button that, when clicked, prompts a confirmation modal (e.g., "Are you sure? This will erase all data").
	- Upon confirmation, resets the app to its initial state.
- **Delete Account sub-page**:
	- Displays a button that, when clicked, prompts a confirmation modal (e.g., "Are you sure? This will delete your account and data").
	- Upon confirmation, terminates the account and erases all data.
- All sub-pages load without delay and save changes persistently.
### Rationale
The Setting Scene enhances user control and trust in the app by offering a range of personalization and management options. Here’s why each feature is included:

- **Centralized Configuration**: A list-based landing page with sub-pages simplifies navigation, making settings easy to find and adjust.
- **Account Information**: Optional fields with a clear purpose encourage course creators to build credibility, while transparency about data use builds trust.
- **Theme and Fonts**: Customizable visuals improve accessibility and comfort, catering to diverse user preferences.
- **Keyboard Options**: Special formatters enhance technical input efficiency, aligning with educational needs.
- **Notification Controls**: Flexible reminders support user habits without being intrusive, balancing engagement and autonomy.
- **Data and Privacy**: Providing data access and policy visibility ensures transparency and compliance, fostering confidence.
- **Subscription Management**: Clear subscription info and options streamline user decisions about premium features.
- **Data/Account Deletion**: Reset and termination options give users ultimate control, reinforcing trust and flexibility.
This scene empowers users to tailor their experience while ensuring transparency and compliance, aligning with the app’s goal of a user-centric learning environment.



## Miscellaneous
1. ## <a id="fr-014"></a>Subscription
**Requirement ID**: FR-014 

**Scene ID**: TBD
### Descriptions
The Subscription feature governs access to premium functionalities within the app, balancing free trial access with paid subscription requirements. Here’s how it operates:

- **Free Trial**: New users are offered a 7-day free trial upon first using the app, providing full access to all features. Each user is limited to a single free trial, tracked by their account or device identifier.
- **Post-Trial Restriction**: After the 7-day trial expires, users must subscribe to continue using the app. Without a subscription:
	Access to the entire app or specific premium features is blocked.
	The system prompts users to subscribe to regain access.
- **Subscription Display Scene**: A dedicated scene (or section within an existing scene, e.g., Setting Scene) showcases the perks of a pro subscription, including:
	- **Chat Assistant**: Full access to the assistive AI chat feature.
	- **Unlimited Creation of Subjects**: No limit on the number of subjects users can create.
	- **Publishing Sources to Book Marketplace**: Ability to distribute self-authored courses to the marketplace.
	- **Verified User**: A badge or indicator marking the user as a verified subscriber, enhancing credibility (e.g., for course publishing).
### Workflow
- New users activate the trial upon app signup or first use.
- During the trial, all features are available; a countdown or notification may remind users of the trial’s end.
- Post-trial, non-subscribers face restricted access until they subscribe, with the subscription scene guiding them through the process and highlighting benefits.
### Acceptance Criteria
To ensure the Subscription feature functions as intended, the following must be verified:

- New users receive a 7-day free trial upon first app use, granting full access to all features.
- The system tracks trial usage, ensuring each user (via account or device ID) receives only one trial period.
- After 7 days, non-subscribed users are blocked from:
	- Using the entire app, or
	- Accessing specific premium features (e.g., Chat Assistant, subject creation beyond a limit, marketplace publishing, verified status), depending on implementation.
- A subscription prompt appears post-trial, preventing further use until a subscription is activated.
- The subscription display scene lists all pro subscriber perks:
	- "Chat Assistant" access.
	- "Unlimited Creation of Subjects" with no cap.
	- "Publishing Sources to Book Marketplace" functionality.
- "Verified User" badge or indicator.
- Subscribing removes all restrictions, enabling full access to listed perks.
- The trial countdown (e.g., "3 days remaining") is visible during the trial period, ideally in the - Setting Scene or Home Scene notification bar.
- Existing subscribers (post-trial or otherwise) see their current subscription status and perks without trial prompts.
### Rationale
The Subscription feature balances accessibility for new users with a sustainable model for ongoing app usage. Here’s why each aspect is included:

- **7-Day Free Trial**: Offering a trial period attracts new users by allowing them to explore the app’s full potential risk-free, encouraging adoption while setting a clear expectation of future cost.
- **Single Trial Limit**: Restricting trials to one per user prevents abuse, ensuring fairness and protecting revenue potential.
- **Post-Trial Restriction**: Blocking access after the trial incentivizes subscription while maintaining a clear distinction between free and paid tiers, aligning with a freemium model.
- **Perks Display**: Highlighting benefits like Chat Assistant, unlimited subject creation, marketplace publishing, and verified status clarifies the value of subscribing, motivating users to upgrade for enhanced functionality and credibility.
- **Feature-Specific Blocking**: Limiting premium features post-trial (if not the entire app) provides flexibility in design, allowing partial use to retain users while pushing for subscription.
  
This feature supports user onboarding and retention while establishing a clear monetization strategy, ensuring the app’s long-term viability and rewarding subscribers with meaningful enhancements.
 
