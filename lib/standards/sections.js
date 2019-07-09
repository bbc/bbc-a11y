module.exports = {
  'bbc-mag-principles': {
    title: 'Principles',
    tests: [
      require('./tests/allDocumentsMustHaveAW3cRecommendedDoctype'),
      require('./tests/markupMustValidateAgainstDoctype'),
      require('./tests/anchorsMustHaveHrefs')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/principles'
  },

  'bbc-mag-audio-and-video-alternatives-for-audio-and-visual-content': {
    title: 'Audio & Video: Alternatives for audio and visual content',
    tests: [
      require('./tests/alternativeDeliveryForEmbeddedMediaMustBeProvided')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/alternatives-for-audio-and-visual-content'
  },

  'bbc-mag-audio-and-video-autoplay': {
    title: 'Audio & Video: Autoplay',
    tests: [
      require('./tests/audioMustNotPlayAutomaticallyWithoutControls')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/autoplay'
  },

  'bbc-mag-audio-and-video-metadata': {
    title: 'Audio & Video: Metadata',
    tests: [
      require('./tests/relevantMetadataShouldBeProvidedForAllMedia')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/metadata'
  },

  'bbc-mag-audio-and-video-volume-control': {
    title: 'Audio & Video: Volume control',
    tests: [
      require('./tests/volumeControlsShouldBeProvidedForInteractiveMedia')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/volume-control'
  },

  'bbc-mag-audio-and-video-audio-conflict': {
    title: 'Audio & Video: Audio conflict',
    tests: [
      require('./tests/narrativeAudioShouldNotConflictWithAssistiveTechnology')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/audio-and-video/audio-conflict'
  },

  'bbc-mag-design-colour-contrast': {
    title: 'Design: Colour contrast',
    tests: [
      require('./tests/colourCombinationsMustPassColourContrastCheck')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/colour-contrast'
  },

  'bbc-mag-design-colour-and-meaning': {
    title: 'Design: Colour and meaning',
    tests: [
      require('./tests/informationConveyedWithColourMustAlsoBeIdentifiableFromContextOrMarkup')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/colour-and-meaning'
  },

  'bbc-mag-design-styling-and-readability': {
    title: 'Design: Styling and readability',
    tests: [
      require('./tests/coreContentMustBeAccessibleWhenStylingIsRemoved')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/styling-and-readability'
  },

  'bbc-mag-design-touch-target-size': {
    title: 'Design: Touch target size',
    tests: [
      require('./tests/touchTargetsMustBeLargeEnoughToTouchAccurately')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/touch-target-size'
  },

  'bbc-mag-design-spacing': {
    title: 'Design: Spacing',
    tests: [
      require('./tests/inactiveSpaceShouldBeProvidedAroundActionableElements')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/spacing'
  },

  'bbc-mag-design-content-resizing': {
    title: 'Design: Content resizing',
    tests: [
      require('./tests/contentMustBeVisibleAndUsableWithPageZoomed'),
      require('./tests/contentMustBeVisibleAndUsableWithTextResized'),
      require('./tests/textMustBeStyledWithUnitsThatAreResizableInAllBrowsers'),
      require('./tests/textCannotBeTooSmall')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/content-resizing'
  },

  'bbc-mag-design-actionable-elements': {
    title: 'Design: Actionable elements',
    tests: [
      require('./tests/editorialLinksMustBeSelfEvident')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/actionable-elements'
  },

  'bbc-mag-design-visible-focus': {
    title: 'Design: Visible focus',
    tests: [
      require('./tests/focusedElementsMustVisiblyChangeState'),
      require('./tests/elementsMustBeVisibleOnFocus')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/visible-focus'
  },

  'bbc-mag-design-consistency': {
    title: 'Design: Consistency',
    tests: [
      require('./tests/userExperienceShouldBeConsistent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/consistency'
  },

  'bbc-mag-design-choise': {
    title: 'Design: Choice',
    tests: [
      require('./tests/interfacesMustProvideMultipleWaysToInteractWithContent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/choice'
  },

  'bbc-mag-design-adjustability': {
    title: 'Design: Adjustability',
    tests: [
      require('./tests/interactiveMediaShouldBeAdjustableForUserAbilityAndPreference')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/adjustability'
  },

  'bbc-mag-design-flicker': {
    title: 'Design: Flicker',
    tests: [
      require('./tests/contentMustNotFlickerOrFlash')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/design/flicker'
  },

  'bbc-mag-editorial-flicker': {
    title: 'Editorial: Consistent labelling',
    tests: [
      require('./tests/consistentLabellingShouldBeUsed')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/consistent-labelling'
  },

  'bbc-mag-editorial-indicating-language': {
    title: 'Editorial: Indicating language',
    tests: [
      require('./tests/htmlMustHaveLangAttribute'),
      require('./tests/changesToLanguageMustBeIndicated')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/indicating-language'
  },

  'bbc-mag-editorial-instructions': {
    title: 'Editorial: Instructions',
    tests: [
      require('./tests/additionalInstructionsShouldBeProvided')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/editorial/instructions'
  },

  'bbc-mag-focus-focusable-elements': {
    title: 'Focus: Focusable elements',
    tests: [
      require('./tests/interactiveElementsMustBeFocusable'),
      require('./tests/elementsWithZeroTabIndexMustBeFocusableByDefault')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/focusable-elements'
  },

  'bbc-mag-focus-keyboard-trap': {
    title: 'Focus: Keyboard trap',
    tests: [
      require('./tests/thereMustNotBeAKeyboardTrap')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/keyboard-trap'
  },

  'bbc-mag-focus-content-order': {
    title: 'Focus: Content order',
    tests: [
      require('./tests/contentOrderMustBeLogical')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/content-order'
  },

  'bbc-mag-focus-focus-order': {
    title: 'Focus: Focus order',
    tests: [
      require('./tests/actionableContentMustBeNavigableInAMeaningfulSequence')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/focus-order'
  },

  'bbc-mag-focus-changing-focus': {
    title: 'Focus: Changing focus',
    tests: [
      require('./tests/focusOrContextMustNotAutomaticallyChangeDuringUserInput'),
      require('./tests/formsMustHaveSubmitButtons')
    ],
    documentationUrl: 'https://www.bbc.co.uk/accessibility/forproducts/guides/mobile/changing-focus'
  },

  'bbc-mag-focus-user-interactions': {
    title: 'Focus: User interactions',
    tests: [
      require('./tests/actionsMustBeTriggeredWhenAppropriate')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/user-interactions'
  },

  'bbc-mag-focus-alternative-input-methods': {
    title: 'Focus: Alternative input methods',
    tests: [
      require('./tests/alternativeInputMethodsMustBeSupported')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/focus/alternative-input-methods'
  },

  'bbc-mag-forms-labelling-form-controls': {
    title: 'Forms: Labelling form controls',
    tests: [
      require('./tests/fieldsMustHaveLabelsOrTitles')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/labelling-form-controls'
  },

  'bbc-mag-forms-form-inputs': {
    title: 'Forms: Form inputs',
    tests: [
      require('./tests/aDefaultInputFormatMustBeIndicatedAndSupported')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/form-inputs'
  },

  'bbc-mag-forms-form-layout': {
    title: 'Forms: Form layout',
    tests: [
      require('./tests/labelsMustBeCloseAndLaidOutAppropriately')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/form-layout'
  },

  'bbc-mag-forms-grouping-form-elements': {
    title: 'Forms: Grouping form elements',
    tests: [
      require('./tests/controlsLabelsAndOtherFormElementsMustBeProperlyGrouped')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/forms/grouping-form-elements'
  },

  'bbc-mag-images-images-of-text': {
    title: 'Images: Images of text',
    tests: [
      require('./tests/imagesOfTextShouldBeAvoided')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/images/images-of-text'
  },

  'bbc-mag-images-background-images': {
    title: 'Images: Background images',
    tests: [
      require('./tests/meaningfulBackgroundImagesMustHaveAccessibleAlternatives')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/images/background-images'
  },

  'bbc-mag-links-descriptive-links': {
    title: 'Links: Descriptive links',
    tests: [
      require('./tests/linkAndNavigationTextMustUniquelyDescribeTheTargetOrFunction')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/descriptive-links'
  },

  'bbc-mag-links-links-to-alternative-formats': {
    title: 'Links: Links to alternative formats',
    tests: [
      require('./tests/linksToAlternativeFormatsMustIndicateThatAnAlternativeIsOpening')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/links-to-alternative-formats'
  },

  'bbc-mag-links-combining-repeated-links': {
    title: 'Links: Combining repeated links',
    tests: [
      require('./tests/repeatedLinksToTheSameResourceMustBeCombined')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/links/combining-repeated-links'
  },

  'bbc-mag-notifications-inclusive-notifications': {
    title: 'Notifications: Inclusive notifications',
    tests: [
      require('./tests/notificationsMustBeBothVisibleAndAudible')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/inclusive-notifications'
  },

  'bbc-mag-notifications-standard-operating-system-notifications': {
    title: 'Notifications: Standard operating system notifications',
    tests: [
      require('./tests/preferStandardOperatingSystemNotifications')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/standard-operating-system-notifications'
  },

  'bbc-mag-notifications-error-messages-and-correction': {
    title: 'Notifications: Error messages and correction',
    tests: [
      require('./tests/clearErrorMessagesMustBeProvided')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/error-messages-and-correction'
  },

  'bbc-mag-notifications-feedback-and-assistance': {
    title: 'Notifications: Feedback and assistance',
    tests: [
      require('./tests/nonCriticalFeedbackOrAssistanceShouldBeProvidedWhenAppropriate')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/notifications/feedback-and-assistance'
  },

  'bbc-mag-scripts-and-dynamic-content-progressive-functionality': {
    title: 'Scripts and dynamic content: Progressive functionality',
    tests: [
      require('./tests/scriptsAndDynamicContentMustBeBuiltInAProgressiveManner')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/progressive-functionality'
  },

  'bbc-mag-scripts-and-dynamic-content-controlling-media': {
    title: 'Scripts and dynamic content: Controlling media',
    tests: [
      require('./tests/mediaThatUpdatesAndAnimationMustHaveAPauseStopOrHideControl')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/controlling-media'
  },

  'bbc-mag-scripts-and-dynamic-content-page-refreshes': {
    title: 'Scripts and dynamic content: Page refreshes',
    tests: [
      require('./tests/automaticPageRefreshesMustNotBeUsedWithoutWarning')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/page-refreshes'
  },

  'bbc-mag-scripts-and-dynamic-content-timeouts': {
    title: 'Scripts and dynamic content: Timeouts',
    tests: [
      require('./tests/timedResponsesMustBeAdjustable')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/timeouts'
  },

  'bbc-mag-scripts-and-dynamic-content-input-control': {
    title: 'Scripts and dynamic content: Input control',
    tests: [
      require('./tests/interactionInputControlShouldBeAdaptable')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/scripts-and-dynamic-content/input-control'
  },

  'bbc-mag-structure-unique-page-screen-titles': {
    title: 'Structure: Unique page/screen titles',
    tests: [
      require('./tests/pageTitlesMustBeUniquelyAndClearlyIdentifiable'),
      require('./tests/titleElementMustIdentifyMainContent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/unique-pagescreen-titles'
  },

  'bbc-mag-structure-headings': {
    title: 'Structure: Headings',
    tests: [
      require('./tests/headingsMustBeInAscendingOrder'),
      require('./tests/exactlyOneMainHeading'),
      require('./tests/contentMustFollowHeadings')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/headings'
  },

  'bbc-mag-structure-containers-and-landmarks': {
    title: 'Structure: Containers and landmarks',
    tests: [
      require('./tests/containersShouldBeUsedToDescribePageStructure'),
      require('./tests/exactlyOneMainLandmark')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/containers-and-landmarks'
  },

  'bbc-mag-structure-grouped-elements': {
    title: 'Structure: Grouped elements',
    tests: [
      require('./tests/groupedInterfaceElementsMustBeRepresentedAsASingleComponent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/structure/grouped-elements'
  },

  'bbc-mag-text-equivalents-alternatives-for-non-text-content': {
    title: 'Text equivalents: Alternatives for non-text content',
    tests: [
      require('./tests/alternativesMustBrieflyDescribeEditorialIntent'),
      require('./tests/imagesMustHaveAltAttributes')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/alternatives-for-non-text-content'
  },

  'bbc-mag-text-equivalents-decorative-content': {
    title: 'Text equivalents: Decorative content',
    tests: [
      require('./tests/decorativeImagesMustBeHiddenFromAssistiveTechnology')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/decorative-content'
  },

  'bbc-mag-text-equivalents-tooltips-and-supplementary-information': {
    title: 'Text equivalents: Tooltips and supplementary information',
    tests: [
      require('./tests/tooltipsMustNotRepeatLinkTextOrOtherAlternatives'),
      require('./tests/titleAttributesOnlyOnInputs'),
      require('./tests/titleAttributesMustNotDuplicateContent')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/tooltips-and-supplementary-information'
  },

  'bbc-mag-text-equivalents-roles-traits-and-properties': {
    title: 'Text equivalents: Roles, traits and properties',
    tests: [
      require('./tests/elementsMustHaveAccessibilityPropertiesSetAppropriately')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/roles-traits-and-properties'
  },

  'bbc-mag-text-equivalents-visual-formatting': {
    title: 'Text equivalents: Visual formatting',
    tests: [
      require('./tests/visualFormattingAloneMustNotBeUsedToConveyMeaning'),
      require('./tests/useTablesForData')
    ],
    documentationUrl: 'http://www.bbc.co.uk/guidelines/futuremedia/accessibility/mobile/text-equivalents/visual-formatting'
  }
}
