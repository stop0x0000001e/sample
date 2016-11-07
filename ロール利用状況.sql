select MRoleGroup.ProjectId, MProject.ProjectName, MRoleGroup.RoleGroupId, MRoleGroup.RoleGroupName, SettingNum, MemberNum
from MRoleGroup
left outer join MProject
on MRoleGroup.ProjectId = MProject.ProjectId
left outer join
    (
        select RoleGroupId, COUNT(*) as MemberNum
		from MRoleGroupMember
        group by RoleGroupId
    ) as member
on  MRoleGroup.RoleGroupId = member.RoleGroupId
left outer join
	(
		select UserId as RoleGroupId, COUNT(*) as SettingNum
		from MUserRole
		--where UserId like 'rg%'
		group by UserId
	) as role
on MRoleGroup.RoleGroupId = role.RoleGroupId