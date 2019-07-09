module.exports = {
  'bbc-mag-principles': {
    title: 'Principles',
    tests: [
      require('./tests/allDocumentsMustHaveAW3cRecommendedDoctype'),
      require('./tests/markupMustValidateAgainstDoctype'),
      require('./tests/anchorsMustHaveHrefs')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/principles'
  },

  'bbc-mag-audio-and-video-alternatives-for-audio-and-visual-content': {
    title: 'Audio & Video: Alternatives for audio and visual content',
    tests: [
      require('./tests/alternativeDeliveryForEmbeddedMediaMustBeProvided')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternatives-for-audio-and-visual-content'
  },

  'bbc-mag-audio-and-video-autoplay': {
    title: 'Audio & Video: Autoplay',
    tests: [
      require('./tests/audioMustNotPlayAutomaticallyWithoutControls')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/autoplay'
  },

  'bbc-mag-audio-and-video-metadata': {
    title: 'Audio & Video: Metadata',
    tests: [
      require('./tests/relevantMetadataShouldBeProvidedForAllMedia')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/metadata'
  },

  'bbc-mag-audio-and-video-volume-control': {
    title: 'Audio & Video: Volume control',
    tests: [
      require('./tests/volumeControlsShouldBeProvidedForInteractiveMedia')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/volume-control'
  },

  'bbc-mag-audio-and-video-audio-conflict': {
    title: 'Audio & Video: Audio conflict',
    tests: [
      require('./tests/narrativeAudioShouldNotConflictWithAssistiveTechnology')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/audio-conflict'
  },

  'bbc-mag-design-colour-contrast': {
    title: 'Design: Colour contrast',
    tests: [
      require('./tests/colourCombinationsMustPassColourContrastCheck')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/colour-contrast'
  },

  'bbc-mag-design-colour-and-meaning': {
    title: 'Design: Colour and meaning',
    tests: [
      require('./tests/informationConveyedWithColourMustAlsoBeIdentifiableFromContextOrMarkup')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/colour-and-meaning'
  },

  'bbc-mag-design-styling-and-readability': {
    title: 'Design: Styling and readability',
    tests: [
      require('./tests/coreContentMustBeAccessibleWhenStylingIsRemoved')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/styling-and-readability'
  },

  'bbc-mag-design-touch-target-size': {
    title: 'Design: Touch target size',
    tests: [
      require('./tests/touchTargetsMustBeLargeEnoughToTouchAccurately')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/touch-target-size'
  },

  'bbc-mag-design-spacing': {
    title: 'Design: Spacing',
    tests: [
      require('./tests/inactiveSpaceShouldBeProvidedAroundActionableElements')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/spacing'
  },

  'bbc-mag-design-content-resizing': {
    title: 'Design: Content resizing',
    tests: [
      require('./tests/contentMustBeVisibleAndUsableWithPageZoomed'),
      require('./tests/contentMustBeVisibleAndUsableWithTextResized'),
      require('./tests/textMustBeStyledWithUnitsThatAreResizableInAllBrowsers'),
      require('./tests/textCannotBeTooSmall')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/content-resizing'
  },

  'bbc-mag-design-actionable-elements': {
    title: 'Design: Actionable elements',
    tests: [
      require('./tests/editorialLinksMustBeSelfEvident')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/actionable-elements'
  },

  'bbc-mag-design-visible-focus': {
    title: 'Design: Visible focus',
    tests: [
      require('./tests/focusedElementsMustVisiblyChangeState'),
      require('./tests/elementsMustBeVisibleOnFocus')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/visible-focus'
  },

  'bbc-mag-design-consistency': {
    title: 'Design: Consistency',
    tests: [
      require('./tests/userExperienceShouldBeConsistent')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/consistency'
  },

  'bbc-mag-design-choice': {
    title: 'Design: Choice',
    tests: [
      require('./tests/interfacesMustProvideMultipleWaysToInteractWithContent')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/choice'
  },

  'bbc-mag-design-adjustability': {
    title: 'Design: Adjustability',
    tests: [
      require('./tests/interactiveMediaShouldBeAdjustableForUserAbilityAndPreference')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/adjustability'
  },

  'bbc-mag-design-flicker': {
    title: 'Design: Flicker',
    tests: [
      require('./tests/contentMustNotFlickerOrFlash')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/flicker'
  },

  'bbc-mag-editorial-consistent-labelling': {
    title: 'Editorial: Consistent labelling',
    tests: [
      require('./tests/consistentLabellingShouldBeUsed')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/consistent-labelling'
  },

  'bbc-mag-editorial-indicating-language': {
    title: 'Editorial: Indicating language',
    tests: [
      require('./tests/htmlMustHaveLangAttribute'),
      require('./tests/changesToLanguageMustBeIndicated')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/indicating-language'
  },

  'bbc-mag-editorial-instructions': {
    title: 'Editorial: Instructions',
    tests: [
      require('./tests/additionalInstructionsShouldBeProvided')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/instructions'
  },

  'bbc-mag-focus-focusable-elements': {
    title: 'Focus: Focusable elements',
    tests: [
      require('./tests/interactiveElementsMustBeFocusable'),
      require('./tests/elementsWithZeroTabIndexMustBeFocusableByDefault')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/focusable-elements'
  },

  'bbc-mag-focus-keyboard-trap': {
    title: 'Focus: Keyboard trap',
    tests: [
      require('./tests/thereMustNotBeAKeyboardTrap')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/keyboard-trap'
  },

  'bbc-mag-focus-content-order': {
    title: 'Focus: Content order',
    tests: [
      require('./tests/contentOrderMustBeLogical')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/content-order'
  },

  'bbc-mag-focus-focus-order': {
    title: 'Focus: Focus order',
    tests: [
      require('./tests/actionableContentMustBeNavigableInAMeaningfulSequence')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/focus-order'
  },

  'bbc-mag-focus-changing-focus': {
    title: 'Focus: Changing focus',
    tests: [
      require('./tests/focusOrContextMustNotAutomaticallyChangeDuringUserInput'),
      require('./tests/formsMustHaveSubmitButtons')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/changing-focus'
  },

  'bbc-mag-focus-appropriate-triggers': {
    title: 'Focus: Appropriate triggers',
    tests: [
      require('./tests/actionsMustBeTriggeredWhenAppropriate')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/appropriate-triggers'
  },

  'bbc-mag-focus-alternative-input-methods': {
    title: 'Focus: Alternative input methods',
    tests: [
      require('./tests/alternativeInputMethodsMustBeSupported')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternative-input-methods'
  },

  'bbc-mag-forms-labelling-form-controls': {
    title: 'Forms: Labelling form controls',
    tests: [
      require('./tests/fieldsMustHaveLabelsOrTitles')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/labelling-form-controls'
  },

  'bbc-mag-forms-input-format': {
    title: 'Forms: Input format',
    tests: [
      require('./tests/aDefaultInputFormatMustBeIndicatedAndSupported')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/input-format'
  },

  'bbc-mag-forms-form-layout': {
    title: 'Forms: Form layout',
    tests: [
      require('./tests/labelsMustBeCloseAndLaidOutAppropriately')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/form-layout'
  },

  'bbc-mag-forms-grouping-form-elements': {
    title: 'Forms: Grouping form elements',
    tests: [
      require('./tests/controlsLabelsAndOtherFormElementsMustBeProperlyGrouped')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/grouping-form-elements'
  },

  'bbc-mag-images-images-of-text': {
    title: 'Images: Images of text',
    tests: [
      require('./tests/imagesOfTextShouldBeAvoided')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/images-of-text'
  },

  'bbc-mag-images-background-images': {
    title: 'Images: Background images',
    tests: [
      require('./tests/meaningfulBackgroundImagesMustHaveAccessibleAlternatives')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/background-images'
  },

  'bbc-mag-links-descriptive-links': {
    title: 'Links: Descriptive links',
    tests: [
      require('./tests/linkAndNavigationTextMustUniquelyDescribeTheTargetOrFunction')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/descriptive-links'
  },

  'bbc-mag-links-links-to-alternative-formats': {
    title: 'Links: Links to alternative formats',
    tests: [
      require('./tests/linksToAlternativeFormatsMustIndicateThatAnAlternativeIsOpening')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/links-to-alternative-formats'
  },

  'bbc-mag-links-combining-repeated-links': {
    title: 'Links: Combining repeated links',
    tests: [
      require('./tests/repeatedLinksToTheSameResourceMustBeCombined')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/combining-repeated-links'
  },

  'bbc-mag-notifications-inclusive-notifications': {
    title: 'Notifications: Inclusive notifications',
    tests: [
      require('./tests/notificationsMustBeBothVisibleAndAudible')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/inclusive-notifications'
  },

  'bbc-mag-notifications-standard-operating-system-notifications': {
    title: 'Notifications: Standard operating system notifications',
    tests: [
      require('./tests/preferStandardOperatingSystemNotifications')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/standard-operating-system-notifications'
  },

  'bbc-mag-notifications-error-messages-and-correction': {
    title: 'Notifications: Error messages and correction',
    tests: [
      require('./tests/clearErrorMessagesMustBeProvided')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/error-messages-and-correction'
  },

  'bbc-mag-notifications-feedback-and-assistance': {
    title: 'Notifications: Feedback and assistance',
    tests: [
      require('./tests/nonCriticalFeedbackOrAssistanceShouldBeProvidedWhenAppropriate')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/feedback-and-assistance'
  },

  'bbc-mag-scripts-and-dynamic-content-progressive-functionality': {
    title: 'Scripts and dynamic content: Progressive functionality',
    tests: [
      require('./tests/scriptsAndDynamicContentMustBeBuiltInAProgressiveManner')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/progressive-functionality'
  },

  'bbc-mag-scripts-and-dynamic-content-controlling-media': {
    title: 'Scripts and dynamic content: Controlling media',
    tests: [
      require('./tests/mediaThatUpdatesAndAnimationMustHaveAPauseStopOrHideControl')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/controlling-media'
  },

  'bbc-mag-scripts-and-dynamic-content-page-refreshes': {
    title: 'Scripts and dynamic content: Page refreshes',
    tests: [
      require('./tests/automaticPageRefreshesMustNotBeUsedWithoutWarning')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/page-refreshes'
  },

  'bbc-mag-scripts-and-dynamic-content-timeouts': {
    title: 'Scripts and dynamic content: Timeouts',
    tests: [
      require('./tests/timedResponsesMustBeAdjustable')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/timeouts'
  },

  'bbc-mag-scripts-and-dynamic-content-input-control': {
    title: 'Scripts and dynamic content: Input control',
    tests: [
      require('./tests/interactionInputControlShouldBeAdaptable')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/input-control'
  },

  'bbc-mag-structure-unique-page-screen-titles': {
    title: 'Structure: Unique page/screen titles',
    tests: [
      require('./tests/pageTitlesMustBeUniquelyAndClearlyIdentifiable'),
      require('./tests/titleElementMustIdentifyMainContent')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/unique-pagescreen-titles'
  },

  'bbc-mag-structure-headings': {
    title: 'Structure: Headings',
    tests: [
      require('./tests/headingsMustBeInAscendingOrder'),
      require('./tests/exactlyOneMainHeading'),
      require('./tests/contentMustFollowHeadings')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/headings'
  },

  'bbc-mag-structure-containers-and-landmarks': {
    title: 'Structure: Containers and landmarks',
    tests: [
      require('./tests/containersShouldBeUsedToDescribePageStructure'),
      require('./tests/exactlyOneMainLandmark')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/containers-and-landmarks'
  },

  'bbc-mag-structure-grouped-elements': {
    title: 'Structure: Grouped elements',
    tests: [
      require('./tests/groupedInterfaceElementsMustBeRepresentedAsASingleComponent')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/grouped-elements'
  },

  'bbc-mag-text-equivalents-alternatives-for-non-text-content': {
    title: 'Text equivalents: Alternatives for non-text content',
    tests: [
      require('./tests/alternativesMustBrieflyDescribeEditorialIntent'),
      require('./tests/imagesMustHaveAltAttributes')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/alternatives-for-non-text-content'
  },

  'bbc-mag-text-equivalents-decorative-content': {
    title: 'Text equivalents: Decorative content',
    tests: [
      require('./tests/decorativeImagesMustBeHiddenFromAssistiveTechnology')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/decorative-content'
  },

  'bbc-mag-text-equivalents-tooltips-and-supplementary-information': {
    title: 'Text equivalents: Tooltips and supplementary information',
    tests: [
      require('./tests/tooltipsMustNotRepeatLinkTextOrOtherAlternatives'),
      require('./tests/titleAttributesOnlyOnInputs'),
      require('./tests/titleAttributesMustNotDuplicateContent')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/tooltips-and-supplementary-information'
  },

  'bbc-mag-text-equivalents-roles-traits-and-properties': {
    title: 'Text equivalents: Roles, traits and properties',
    tests: [
      require('./tests/elementsMustHaveAccessibilityPropertiesSetAppropriately')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/roles-traits-and-properties'
  },

  'bbc-mag-text-equivalents-visual-formatting': {
    title: 'Text equivalents: Visual formatting',
    tests: [
      require('./tests/visualFormattingAloneMustNotBeUsedToConveyMeaning'),
      require('./tests/useTablesForData')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/visual-formatting'
  }
}
