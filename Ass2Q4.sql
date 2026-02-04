

select family_member_name,family,contribution,
	(contribution * 100.0 / sum(contribution) over (partition by family))
	as percentage_of_family_member
	from FamilyMemberContribution;