// To parse this JSON data, do
//
//     final issues = issuesFromJson(jsonString);

import 'dart:convert';

List<Issues> issuesFromJson(String str) => List<Issues>.from(json.decode(str).map((x) => Issues.fromJson(x)));

String issuesToJson(List<Issues> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Issues {
  Issues({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.pullRequest,
    this.body,
    this.performedViaGithubApp,
  });

  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  String nodeId;
  int number;
  String title;
  User user;
  List<Label> labels;
  var state;
  bool locked;
  dynamic assignee;
  List<dynamic> assignees;
  Milestone milestone;
  int comments;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic closedAt;
  AuthorAssociation authorAssociation;
  dynamic activeLockReason;
  PullRequest pullRequest;
  String body;
  dynamic performedViaGithubApp;

  factory Issues.fromJson(Map<String, dynamic> json) => Issues(
    url: json["url"],
    repositoryUrl: json["repository_url"],
    labelsUrl: json["labels_url"],
    commentsUrl: json["comments_url"],
    eventsUrl: json["events_url"],
    htmlUrl: json["html_url"],
    id: json["id"],
    nodeId: json["node_id"],
    number: json["number"],
    title: json["title"],
    user: User.fromJson(json["user"]),
    labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
    state: json["state"],
    locked: json["locked"],
    assignee: json["assignee"],
    assignees: List<dynamic>.from(json["assignees"].map((x) => x)),
    milestone: json["milestone"] == null ? null : Milestone.fromJson(json["milestone"]),
    comments: json["comments"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    closedAt: json["closed_at"],
    authorAssociation: authorAssociationValues.map[json["author_association"]],
    activeLockReason: json["active_lock_reason"],
    pullRequest: json["pull_request"] == null ? null : PullRequest.fromJson(json["pull_request"]),
    body: json["body"],
    performedViaGithubApp: json["performed_via_github_app"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "repository_url": repositoryUrl,
    "labels_url": labelsUrl,
    "comments_url": commentsUrl,
    "events_url": eventsUrl,
    "html_url": htmlUrl,
    "id": id,
    "node_id": nodeId,
    "number": number,
    "title": title,
    "user": user.toJson(),
    "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
    "state": state,
    "locked": locked,
    "assignee": assignee,
    "assignees": List<dynamic>.from(assignees.map((x) => x)),
    "milestone": milestone == null ? null : milestone.toJson(),
    "comments": comments,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "closed_at": closedAt,
    "author_association": authorAssociationValues.reverse[authorAssociation],
    "active_lock_reason": activeLockReason,
    "pull_request": pullRequest == null ? null : pullRequest.toJson(),
    "body": body,
    "performed_via_github_app": performedViaGithubApp,
  };
}

enum AuthorAssociation { NONE, CONTRIBUTOR }

final authorAssociationValues = EnumValues({
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "NONE": AuthorAssociation.NONE
});

class Label {
  Label({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.labelDefault,
    this.description,
  });

  int id;
  String nodeId;
  String url;
  String name;
  String color;
  bool labelDefault;
  dynamic description;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
    id: json["id"],
    nodeId: json["node_id"],
    url: json["url"],
    name: json["name"],
    color: json["color"],
    labelDefault: json["default"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "url": url,
    "name": name,
    "color": color,
    "default": labelDefault,
    "description": description,
  };
}

class Milestone {
  Milestone({
    this.url,
    this.htmlUrl,
    this.labelsUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.description,
    this.creator,
    this.openIssues,
    this.closedIssues,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.dueOn,
    this.closedAt,
  });

  String url;
  String htmlUrl;
  String labelsUrl;
  int id;
  NodeId nodeId;
  int number;
  String title;
  String description;
  User creator;
  int openIssues;
  int closedIssues;
  var state;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic dueOn;
  dynamic closedAt;

  factory Milestone.fromJson(Map<String, dynamic> json) => Milestone(
    url: json["url"],
    htmlUrl: json["html_url"],
    labelsUrl: json["labels_url"],
    id: json["id"],
    nodeId: nodeIdValues.map[json["node_id"]],
    number: json["number"],
    title: json["title"],
    description: json["description"],
    creator: User.fromJson(json["creator"]),
    openIssues: json["open_issues"],
    closedIssues: json["closed_issues"],
    state: json["state"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    dueOn: json["due_on"],
    closedAt: json["closed_at"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "html_url": htmlUrl,
    "labels_url": labelsUrl,
    "id": id,
    "node_id": nodeIdValues.reverse[nodeId],
    "number": number,
    "title": title,
    "description": description,
    "creator": creator.toJson(),
    "open_issues": openIssues,
    "closed_issues": closedIssues,
    "state": state,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "due_on": dueOn,
    "closed_at": closedAt,
  };
}

class User {
  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    login: json["login"],
    id: json["id"],
    nodeId: json["node_id"],
    avatarUrl: json["avatar_url"],
    gravatarId: json["gravatar_id"],
    url: json["url"],
    htmlUrl: json["html_url"],
    followersUrl: json["followers_url"],
    followingUrl: json["following_url"],
    gistsUrl: json["gists_url"],
    starredUrl: json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"],
    organizationsUrl: json["organizations_url"],
    reposUrl: json["repos_url"],
    eventsUrl: json["events_url"],
    receivedEventsUrl: json["received_events_url"],
    type: typeValues.map[json["type"]],
    siteAdmin: json["site_admin"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "node_id": nodeId,
    "avatar_url": avatarUrl,
    "gravatar_id": gravatarId,
    "url": url,
    "html_url": htmlUrl,
    "followers_url": followersUrl,
    "following_url": followingUrl,
    "gists_url": gistsUrl,
    "starred_url": starredUrl,
    "subscriptions_url": subscriptionsUrl,
    "organizations_url": organizationsUrl,
    "repos_url": reposUrl,
    "events_url": eventsUrl,
    "received_events_url": receivedEventsUrl,
    "type": typeValues.reverse[type],
    "site_admin": siteAdmin,
  };
}

enum Type { USER }

final typeValues = EnumValues({
  "User": Type.USER
});

enum NodeId { M_DK6_T_WLS_ZXN0_B25_L_MJ_Y0_ODY3, M_DK6_T_WLS_ZXN0_B25_L_NJ_EY_NZ_AY, M_DK6_T_WLS_ZXN0_B25_L_NJ_EY_NZ_AX }

final nodeIdValues = EnumValues({
  "MDk6TWlsZXN0b25lMjY0ODY3": NodeId.M_DK6_T_WLS_ZXN0_B25_L_MJ_Y0_ODY3,
  "MDk6TWlsZXN0b25lNjEyNzAx": NodeId.M_DK6_T_WLS_ZXN0_B25_L_NJ_EY_NZ_AX,
  "MDk6TWlsZXN0b25lNjEyNzAy": NodeId.M_DK6_T_WLS_ZXN0_B25_L_NJ_EY_NZ_AY
});



class PullRequest {
  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  String url;
  String htmlUrl;
  String diffUrl;
  String patchUrl;

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
    url: json["url"],
    htmlUrl: json["html_url"],
    diffUrl: json["diff_url"],
    patchUrl: json["patch_url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "html_url": htmlUrl,
    "diff_url": diffUrl,
    "patch_url": patchUrl,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
