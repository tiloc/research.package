part of research_package_model;

/// A content section in a [RPConsentDocument].
///
/// It represents one section in a [RPConsentDocument].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentSection {
  @JsonKey(nullable: false)
  RPConsentSectionType _type;
  String _title;
  String _formalTitle;
  String _summary;
  String _content;

  /// The data type sections that will be displayed if the consent section is of type UserDataCollection or PassiveDataCollection.
  List<RPDataTypeSection> dataTypes;

  /// A custom illustration (an [Image] or [Icon] to show for Custom [RPConsentSectionType]
  @JsonKey(ignore: true)
  Widget customIllustration;

  RPConsentSection();

  /// Returns a populated object with the given [type].
  ///
  /// It is enough to provide only the [type] of the section, the title is automatically filled out.
  /// [summary] is set to [null] initially.
  RPConsentSection.withParams(RPConsentSectionType type,
      {Icon customIcon, Image customImage, Widget customIllustration})
//      : assert(customIllustration.runtimeType == Icon || customIllustration.runtimeType == Image)
  {
    this._type = type;
    this._summary = null;
    this._title = _localizedTitleForConsentSectionType(type);
    this.customIllustration = customIllustration;
  }

  /// The title of the consent section which appears both in [RPVisualConsentStep] and [RPConsentReviewStep].
  String get title => _title;

  String get formalTitle => _formalTitle;

  /// The type of the section.
  ///
  /// The [title] and the image which is shown on the section card is associated to the [type].
  RPConsentSectionType get type => _type;

  /// A longer content text of the section.
  ///
  /// It's presented during [RPVisualConsentStep] when tapping on the "Learn more" button
  /// and during [RPConsentReviewStep] where each section's content is shown to the user.
  String get content => _content;

  /// A short summary of the section. It appears during [RPVisualConsentStep]
  String get summary => _summary;

  set title(String title) {
    this._title = title;
  }

  set content(String content) {
    this._content = content;
  }

  set summary(String summary) {
    this._summary = summary;
  }

  set type(RPConsentSectionType type) {
    this._type = type;
  }

  factory RPConsentSection.fromJson(Map<String, dynamic> json) => _$RPConsentSectionFromJson(json);
  Map<String, dynamic> toJson() => _$RPConsentSectionToJson(this);
}

/// Enum containing the available types for [RPConsentSection].
///
/// Every type has a title and a logo associated to it.
/// Use [Custom] to create your own section type and avoid any prepopulation (title, logo, animation).
/// See more at: [http://researchkit.org/docs/Constants/ORKConsentSectionType.html]
enum RPConsentSectionType {
  Overview,
  DataGathering,
  Privacy,
  DataUse,
  TimeCommitment, // similar to Duration
  Duration,
  StudyTasks,
  StudySurvey,
  Withdrawing, // Similar to Your Rights
  YourRights,
  Welcome,
  AboutUs,
  Goals,
  Benefits,
  DataHandling,
  UserDataCollection,
  PassiveDataCollection,
  Custom
}

String _localizedTitleForConsentSectionType(RPConsentSectionType type) {
  switch (type) {
    case RPConsentSectionType.Overview:
      return "Overview";
      break;
    case RPConsentSectionType.DataGathering:
      return "Data Gathering";
      break;
    case RPConsentSectionType.Privacy:
      return "Privacy";
      break;
    case RPConsentSectionType.DataUse:
      return "Data Use";
      break;
    case RPConsentSectionType.TimeCommitment:
      return "Time Commitment";
      break;
    case RPConsentSectionType.StudyTasks:
      return "Study Tasks";
      break;
    case RPConsentSectionType.StudySurvey:
      return "Study Survey";
      break;
    case RPConsentSectionType.Withdrawing:
      return "Withdrawing";
      break;
    case RPConsentSectionType.Welcome:
      return "Welcome";
      break;
    case RPConsentSectionType.AboutUs:
      return "About us";
      break;
    case RPConsentSectionType.Goals:
      return "Our goal";
      break;
    case RPConsentSectionType.Benefits:
      return "Benefits for you";
      break;
    case RPConsentSectionType.DataHandling:
      return "Data handling";
      break;
    case RPConsentSectionType.Duration:
      return "Study duration";
      break;
    case RPConsentSectionType.YourRights:
      return "Data handling";
      break;
    case RPConsentSectionType.UserDataCollection:
      return "Data collection from you";
      break;
    case RPConsentSectionType.PassiveDataCollection:
      return "Passive data collection";
      break;
    case RPConsentSectionType.Custom:
      return null;
      break;
  }
  return null;
}
